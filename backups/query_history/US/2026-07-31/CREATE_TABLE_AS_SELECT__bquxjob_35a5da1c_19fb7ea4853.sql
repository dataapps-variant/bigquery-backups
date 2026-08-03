-- job_id: bquxjob_35a5da1c_19fb7ea4853
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-31T11:23:32.870000+00:00
-- started: 2026-07-31T11:23:33.320000+00:00
-- ended: 2026-07-31T11:23:36.192000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_Lagged`
AS
SELECT *
FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend`;
