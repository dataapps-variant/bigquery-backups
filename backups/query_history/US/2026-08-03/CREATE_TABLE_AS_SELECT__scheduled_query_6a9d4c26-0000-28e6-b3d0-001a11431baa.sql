-- job_id: scheduled_query_6a9d4c26-0000-28e6-b3d0-001a11431baa
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-03T01:40:04.902000+00:00
-- started: 2026-08-03T01:40:06.421000+00:00
-- ended: 2026-08-03T01:40:13.588000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_lagged`
AS
SELECT
  *
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated`;
