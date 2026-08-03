-- job_id: scheduled_query_6a6f3502-0000-2bae-a049-7474463f9b85
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-28T19:40:02.010000+00:00
-- started: 2026-07-28T19:40:02.463000+00:00
-- ended: 2026-07-28T19:40:05.963000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_1hr_lag_table1`
AS
SELECT
  Channel_name, Date, Channel_type, Channel_code,
  App_name, Final_URL_suffix_AFID, Country,
  Amount, Source,
  current_timestamp AS captured_at
FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend`;
