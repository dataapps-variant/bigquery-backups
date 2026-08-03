-- job_id: scheduled_query_6a97d2f5-0000-2343-a295-24058876f4a8
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-01T23:40:04.259000+00:00
-- started: 2026-08-01T23:40:05.229000+00:00
-- ended: 2026-08-01T23:40:13.472000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_lagged`
AS
SELECT
  *
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated`;
