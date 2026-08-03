-- job_id: scheduled_query_6a95f902-0000-2343-a295-24058876f4a8
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-01T17:40:04.086000+00:00
-- started: 2026-08-01T17:40:04.855000+00:00
-- ended: 2026-08-01T17:40:07.596000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend_lagged`
AS
SELECT
  Channel_name, Date, Channel_type, Channel_code,
  App_name, Final_URL_suffix_AFID, Country,
  Amount, Source,
  current_timestamp AS captured_at
FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend`;
