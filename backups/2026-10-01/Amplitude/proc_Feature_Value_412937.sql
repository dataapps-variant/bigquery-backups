CREATE PROCEDURE `variant-finance-data-project`.Amplitude.proc_Feature_Value_412937(in_days INT64)
BEGIN
  DECLARE win_start DATE DEFAULT
    GREATEST(DATE_SUB(CURRENT_DATE(), INTERVAL in_days DAY), DATE '2026-08-05');

  WITH users AS (
    SELECT
      amplitude_id,
      COUNT(DISTINCT session_key) AS sessions,
      MIN(event_date)             AS first_day
    FROM `variant-finance-data-project.Amplitude.fact_events_412937`
    WHERE event_date >= win_start
      AND NOT is_internal_event
      AND session_key IS NOT NULL
    GROUP BY amplitude_id
  ),
  strata AS (
    -- engagement quartile: the partial control for intent
    SELECT amplitude_id, sessions, NTILE(4) OVER (ORDER BY sessions) AS engagement_quartile
    FROM users
  ),
  converted AS (
    SELECT DISTINCT amplitude_id
    FROM `variant-finance-data-project.Amplitude.fact_events_412937`
    WHERE event_date >= win_start
      AND event_type = 'system/checkout/success'
  ),
  touched AS (
    SELECT DISTINCT amplitude_id, feature_l2
    FROM `variant-finance-data-project.Amplitude.agg_user_feature_daily_412937`
    WHERE event_date >= win_start
      AND surface = 'app'
  )
  SELECT
    t.feature_l2,
    s.engagement_quartile,
    COUNT(DISTINCT t.amplitude_id)                          AS users_touched,
    COUNT(DISTINCT c.amplitude_id)                          AS converted,
    ROUND(SAFE_DIVIDE(COUNT(DISTINCT c.amplitude_id),
                      COUNT(DISTINCT t.amplitude_id)), 4)   AS conversion_rate,
    -- baseline for the same quartile: compare against THIS, not
    -- against the all-user average
    ROUND((SELECT SAFE_DIVIDE(COUNT(DISTINCT cc.amplitude_id), COUNT(DISTINCT ss.amplitude_id))
           FROM strata ss LEFT JOIN converted cc USING (amplitude_id)
           WHERE ss.engagement_quartile = s.engagement_quartile), 4) AS quartile_baseline
  FROM touched t
  JOIN strata s USING (amplitude_id)
  LEFT JOIN converted c ON c.amplitude_id = t.amplitude_id
  GROUP BY t.feature_l2, s.engagement_quartile
  HAVING users_touched >= 200
  ORDER BY t.feature_l2, s.engagement_quartile;
END;
