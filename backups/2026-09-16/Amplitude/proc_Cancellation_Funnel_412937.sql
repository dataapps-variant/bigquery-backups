CREATE PROCEDURE `variant-finance-data-project`.Amplitude.proc_Cancellation_Funnel_412937(in_days INT64)
BEGIN
  DECLARE win_start DATE DEFAULT
    GREATEST(DATE_SUB(CURRENT_DATE(), INTERVAL in_days DAY), DATE '2026-08-05');

  WITH ev AS (
    SELECT
      event_date,
      user_id,
      amplitude_id,
      country,
      CASE
        WHEN event_type LIKE 'app/settings.unsub_prevention_modal/%' THEN 'settings_modal'
        WHEN event_type LIKE 'app/unsub_prevention_page/%'           THEN 'prevention_page'
      END AS offer_surface,
      action,
      event_type
    FROM `variant-finance-data-project.Amplitude.fact_events_412937`
    WHERE event_date >= win_start
      AND user_id IS NOT NULL
  ),
  offers AS (
    SELECT
      offer_surface,
      COUNT(DISTINCT IF(action IN ('open','visit'), user_id, NULL)) AS offered,
      COUNT(DISTINCT IF(action = 'accept',  user_id, NULL))         AS saved,
      COUNT(DISTINCT IF(action = 'decline', user_id, NULL))         AS declined
    FROM ev
    WHERE offer_surface IS NOT NULL
    GROUP BY offer_surface
  ),
  outcomes AS (
    SELECT
      COUNT(DISTINCT IF(event_type = 'app/unsub_questionnaire_page/cancel_subscription', user_id, NULL)) AS cancel_confirmed,
      COUNT(DISTINCT IF(event_type = 'system/subscription/cancel', user_id, NULL))  AS cancelled_backend,
      COUNT(DISTINCT IF(event_type = 'system/subscription/refund', user_id, NULL))  AS refunded,
      COUNT(DISTINCT IF(event_type = 'system/subscription/end',    user_id, NULL))  AS subscription_ended
    FROM ev
  )
  SELECT
    o.offer_surface,
    o.offered,
    o.saved,
    o.declined,
    ROUND(SAFE_DIVIDE(o.saved, o.offered), 4)     AS save_rate,
    ROUND(SAFE_DIVIDE(o.declined, o.offered), 4)  AS decline_rate,
    -- unresolved = offered but neither accepted nor declined (drop-off)
    o.offered - o.saved - o.declined              AS no_response,
    x.cancel_confirmed,
    x.cancelled_backend,
    x.refunded,
    x.subscription_ended
  FROM offers o CROSS JOIN outcomes x
  ORDER BY o.offered DESC;
END;
