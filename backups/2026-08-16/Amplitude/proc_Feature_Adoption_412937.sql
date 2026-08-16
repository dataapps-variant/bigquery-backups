CREATE PROCEDURE `variant-finance-data-project`.Amplitude.proc_Feature_Adoption_412937(in_days INT64)
BEGIN
  DECLARE win_start DATE DEFAULT DATE_SUB(CURRENT_DATE(), INTERVAL in_days DAY);

  WITH base AS (
    SELECT * FROM `variant-finance-data-project.Amplitude.agg_user_feature_daily_412937`
    WHERE event_date BETWEEN win_start AND CURRENT_DATE()
  ),
  denom AS (
    SELECT
      COUNT(DISTINCT amplitude_id) AS all_active,
      COUNT(DISTINCT IF(surface = 'app', amplitude_id, NULL)) AS app_active
    FROM base
  ),
  feat AS (
    SELECT
      surface,
      feature_l1,
      feature_l2,
      COUNT(DISTINCT amplitude_id)  AS users,
      -- stickiness: returned to the feature on 2+ distinct days
      COUNT(DISTINCT IF(days_used >= 2, amplitude_id, NULL)) AS repeat_users,
      SUM(events)                   AS events,
      SUM(sessions)                 AS sessions,
      SUM(error_events)             AS error_events,
      COUNT(DISTINCT IF(is_paying, amplitude_id, NULL)) AS paying_users
    FROM (
      SELECT
        b.*,
        COUNT(DISTINCT event_date) OVER (PARTITION BY amplitude_id, feature_l2) AS days_used
      FROM base b
    )
    GROUP BY surface, feature_l1, feature_l2
  )
  SELECT
    f.surface,
    f.feature_l1,
    f.feature_l2,
    f.users,
    ROUND(f.users / d.app_active, 4)  AS adoption_app_active,   -- USE THIS
    ROUND(f.users / d.all_active, 4)  AS adoption_all_active,   -- context only
    ROUND(SAFE_DIVIDE(f.repeat_users, f.users), 4) AS stickiness,
    ROUND(SAFE_DIVIDE(f.events, f.sessions), 2)    AS events_per_session,
    ROUND(SAFE_DIVIDE(f.error_events, f.events), 4) AS error_rate,
    f.paying_users,
    -- trend reliability flag
    (SELECT MIN(instrumented_from)
     FROM `variant-finance-data-project.Amplitude.dim_feature_412937` dd
     WHERE dd.feature_l2 = f.feature_l2) AS instrumented_from
  FROM feat f CROSS JOIN denom d
  ORDER BY f.users DESC;
END;
