-- job_id: scheduled_query_6a82e801-0000-25d1-8374-d4f547f95ab8
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-29T10:40:05.102000+00:00
-- started: 2026-07-29T10:40:05.566000+00:00
-- ended: 2026-07-29T10:40:09.599000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend_lagged`
AS
SELECT
  Channel_name, Date, Channel_type, Channel_code,
  App_name, Final_URL_suffix_AFID, Country,
  Amount, Source,
  current_timestamp AS captured_at
FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend`;
