CREATE VIEW `variant-finance-data-project.Amplitude.vw_events_parsed`
AS WITH deduped AS (
  SELECT *
  FROM `variant-finance-data-project.Amplitude.EVENTS_412937`
  QUALIFY ROW_NUMBER() OVER (PARTITION BY uuid ORDER BY processed_time DESC) = 1
),
split AS (
  SELECT
    *,
    SPLIT(event_type, '/')                  AS parts,
    ARRAY_LENGTH(SPLIT(event_type, '/'))    AS n_parts
  FROM deduped
),
parsed AS (
  SELECT
    * EXCEPT (parts, n_parts),

    -- surface: app | website | system | (event name itself if unstructured)
    CASE
      WHEN STARTS_WITH(event_type, '[') THEN '_amplitude_internal'
      WHEN n_parts = 1                   THEN '_unstructured'
      ELSE parts[SAFE_OFFSET(0)]
    END AS surface,

    -- action: final token
    CASE
      WHEN n_parts >= 2 THEN parts[SAFE_OFFSET(n_parts - 1)]
      ELSE event_type
    END AS action,

    -- feature_path: everything between surface and action, dot-joined
    CASE
      WHEN n_parts >= 3 THEN
        ARRAY_TO_STRING(
          ARRAY(
            SELECT p FROM UNNEST(parts) AS p WITH OFFSET o
            WHERE o BETWEEN 1 AND n_parts - 2
          ), '.')
      ELSE NULL
    END AS feature_path_raw,

    n_parts
  FROM split
)
SELECT
  * EXCEPT (feature_path_raw, n_parts),

  COALESCE(NULLIF(feature_path_raw, ''), action) AS feature_path,

  -- L1 / L2 / L3 feature hierarchy
  SPLIT(COALESCE(NULLIF(feature_path_raw, ''), action), '.')[SAFE_OFFSET(0)] AS feature_l1,
  ARRAY_TO_STRING(
    ARRAY(SELECT p FROM UNNEST(SPLIT(COALESCE(NULLIF(feature_path_raw,''), action), '.')) p
          WITH OFFSET o WHERE o <= 1), '.') AS feature_l2,
  ARRAY_TO_STRING(
    ARRAY(SELECT p FROM UNNEST(SPLIT(COALESCE(NULLIF(feature_path_raw,''), action), '.')) p
          WITH OFFSET o WHERE o <= 2), '.') AS feature_l3,

  -- exclusion flags -- filter these OUT for product analysis
  (STARTS_WITH(event_type, '[')
   OR event_type IN ('Daily Ad Metrics')
   OR amplitude_event_type IS NOT NULL)              AS is_internal_event,

  (SPLIT(event_type, '/')[SAFE_OFFSET(0)] = 'system') AS is_money_event,

  -- timestamp guard: one event type emits dates in the future
  (event_time > CURRENT_TIMESTAMP())                  AS is_future_dated

FROM parsed;
