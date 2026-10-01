CREATE PROCEDURE `variant-finance-data-project`.Amplitude.proc_Feature_Health_412937(in_days INT64)
BEGIN
  DECLARE win_start DATE DEFAULT DATE_SUB(CURRENT_DATE(), INTERVAL in_days DAY);

  SELECT
    feature_l2,
    COUNT(*)                                          AS events,
    COUNT(DISTINCT amplitude_id)                      AS users,
    COUNTIF(is_error_event)                           AS error_events,
    COUNT(DISTINCT IF(is_error_event, amplitude_id, NULL)) AS users_hitting_error,
    ROUND(SAFE_DIVIDE(COUNTIF(is_error_event), COUNT(*)), 4) AS error_rate,
    -- errors per affected user: >10 means retry storm, not one-off failure
    ROUND(SAFE_DIVIDE(COUNTIF(is_error_event),
          NULLIF(COUNT(DISTINCT IF(is_error_event, amplitude_id, NULL)), 0)), 1)
                                                      AS errors_per_affected_user,
    ROUND(SAFE_DIVIDE(COUNT(DISTINCT IF(is_error_event, amplitude_id, NULL)),
                      COUNT(DISTINCT amplitude_id)), 4) AS pct_users_affected
  FROM `variant-finance-data-project.Amplitude.fact_events_412937`
  WHERE event_date >= win_start
    AND NOT is_internal_event
  GROUP BY feature_l2
  HAVING error_events > 0
  ORDER BY errors_per_affected_user DESC, error_events DESC;
END;
