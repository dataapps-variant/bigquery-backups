-- job_id: scheduled_query_6a745d81-0000-2a64-8c9f-5c337bc74b9b
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-31T22:40:03.403000+00:00
-- started: 2026-07-31T22:40:03.999000+00:00
-- ended: 2026-07-31T22:40:07.701000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend_lagged`
AS
SELECT
  Channel_name, Date, Channel_type, Channel_code,
  App_name, Final_URL_suffix_AFID, Country,
  Amount, Source,
  current_timestamp AS captured_at
FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend`;
