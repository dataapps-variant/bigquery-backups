CREATE VIEW `variant-finance-data-project.Amplitude.vw_amplitude_events_all`
AS WITH src AS (
  SELECT
    CAST(_TABLE_SUFFIX AS INT64) AS app_id,
    *,
    SPLIT(event_type, '/')               AS parts,
    ARRAY_LENGTH(SPLIT(event_type, '/')) AS n_parts
  FROM `variant-finance-data-project.Amplitude.EVENTS_*`
),
flagged AS (
  SELECT
    s.*,
    STARTS_WITH(s.event_type, '[')                   AS is_bracket_event,
    v.surface_token IS NOT NULL                      AS head_is_surface
  FROM src s
  LEFT JOIN `variant-finance-data-project.Amplitude.dim_surface_vocab` v
    ON v.app_id = s.app_id
   AND v.surface_token = s.parts[SAFE_OFFSET(0)]
),
resolved AS (
  SELECT
    * EXCEPT (parts, n_parts, head_is_surface, is_bracket_event),

    CASE
      WHEN is_bracket_event                    THEN '_amplitude_internal'
      WHEN n_parts = 1                         THEN '_lifecycle'
      WHEN n_parts = 2 AND head_is_surface     THEN parts[SAFE_OFFSET(0)]
      WHEN n_parts = 2                         THEN '_implicit_app'
      ELSE parts[SAFE_OFFSET(0)]
    END AS surface,

    CASE
      WHEN n_parts = 1 THEN event_type
      ELSE parts[SAFE_OFFSET(n_parts - 1)]
    END AS action,

    -- the feature path, before hierarchy split
    CASE
      WHEN is_bracket_event THEN event_type
      WHEN n_parts = 1      THEN event_type
      WHEN n_parts = 2 AND head_is_surface
                            THEN parts[SAFE_OFFSET(1)]     -- website/load -> 'load'
      WHEN n_parts = 2      THEN parts[SAFE_OFFSET(0)]     -- test/q_answered -> 'test'
      ELSE ARRAY_TO_STRING(
             ARRAY(SELECT x FROM UNNEST(parts) x WITH OFFSET o
                   WHERE o BETWEEN 1 AND n_parts - 2), '.')
    END AS feature_path,

    n_parts,
    is_bracket_event
  FROM flagged
)
SELECT
  r.* EXCEPT (n_parts, is_bracket_event),

  SPLIT(r.feature_path, '.')[SAFE_OFFSET(0)] AS feature_l1,
  ARRAY_TO_STRING(ARRAY(SELECT x FROM UNNEST(SPLIT(r.feature_path, '.')) x
                        WITH OFFSET o WHERE o <= 1), '.') AS feature_l2,
  ARRAY_TO_STRING(ARRAY(SELECT x FROM UNNEST(SPLIT(r.feature_path, '.')) x
                        WITH OFFSET o WHERE o <= 2), '.') AS feature_l3,

  -- grammar depth actually available for this event (1, 2 or 3)
  LEAST(ARRAY_LENGTH(SPLIT(r.feature_path, '.')), 3) AS feature_depth,

  -- ---- guards ----
  (r.is_bracket_event
   OR r.event_type IN ('Daily Ad Metrics')
   OR r.amplitude_event_type IS NOT NULL)      AS is_internal_event,

  (r.surface = 'system')                       AS is_money_event,

  -- confirmed bad event_time in this dataset: future (to 2026-09-12)
  -- and stale (to 2024-08-13). Floor is deliberately generous;
  -- tighten per app once export start dates are confirmed.
  (r.event_time > CURRENT_TIMESTAMP()
   OR DATE(r.event_time) < DATE '2024-01-01')  AS is_bad_timestamp

FROM resolved r;
