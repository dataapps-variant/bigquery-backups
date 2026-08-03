-- job_id: job_7x8hJaAx362l4FJ7-kCXW3Zj9Cf8
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T13:50:04.980000+00:00
-- started: 2026-07-27T13:50:05.088000+00:00
-- ended: 2026-07-27T13:50:08.362000+00:00

WITH best_snapshot AS (
  SELECT 
    snapshot_id,
    ROW_NUMBER() OVER (ORDER BY captured_at DESC) AS rn
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  WHERE status = 'COMPLETE'
    AND captured_at <= TIMESTAMP_SUB(current_timestamp, INTERVAL 40 MINUTE)
)
SELECT 
  h.Channel_name, h.Date, h.Channel_type, h.Channel_code,
  h.App_name, h.Final_URL_suffix_AFID, h.Country,
  h.Amount, h.Source, h.snapshot_timestamp, h.snapshot_hour_et
FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` AS h
INNER JOIN best_snapshot AS bs ON h.snapshot_id = bs.snapshot_id
WHERE bs.rn = 1
