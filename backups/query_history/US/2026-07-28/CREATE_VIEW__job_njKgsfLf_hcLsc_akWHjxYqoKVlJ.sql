-- job_id: job_njKgsfLf_hcLsc_akWHjxYqoKVlJ
-- user: dataapps@variant.net
-- statement_type: CREATE_VIEW
-- created: 2026-07-28T14:47:00.450000+00:00
-- started: 2026-07-28T14:47:00.673000+00:00
-- ended: 2026-07-28T14:47:00.811000+00:00

CREATE OR REPLACE VIEW
  `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_1hr_lagged1`
AS
WITH latest_aged AS (
  SELECT MAX(captured_at) AS ts
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history1`
  WHERE captured_at <= TIMESTAMP_SUB(current_timestamp, INTERVAL 20 MINUTE)
)
SELECT
  h.Channel_name, h.Date, h.Channel_type, h.Channel_code,
  h.App_name, h.Final_URL_suffix_AFID, h.Country,
  h.Amount, h.Source, h.snapshot_timestamp, h.snapshot_hour_et
FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history1` AS h
JOIN latest_aged AS la ON h.captured_at = la.ts;
