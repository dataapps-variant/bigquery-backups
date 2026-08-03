-- job_id: scheduled_query_6aa1c5cf-0000-274e-a79b-14223bc5fb3e
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-01T12:40:02.387000+00:00
-- started: 2026-08-01T12:40:02.873000+00:00
-- ended: 2026-08-01T12:40:06.168000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend_lagged`
AS
SELECT
  Channel_name, Date, Channel_type, Channel_code,
  App_name, Final_URL_suffix_AFID, Country,
  Amount, Source,
  current_timestamp AS captured_at
FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend`;
