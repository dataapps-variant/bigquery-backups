-- job_id: scheduled_query_6a707d53-0000-2c3f-aaf2-14223bc9e93e
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-29T04:40:06.496000+00:00
-- started: 2026-07-29T04:40:07.466000+00:00
-- ended: 2026-07-29T04:40:10.930000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_1hr_lag_table1`
AS
SELECT
  Channel_name, Date, Channel_type, Channel_code,
  App_name, Final_URL_suffix_AFID, Country,
  Amount, Source,
  current_timestamp AS captured_at
FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend`;
