-- job_id: scheduled_query_6a9f4488-0000-28e6-b3d0-001a11431baa
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-03T06:40:03.327000+00:00
-- started: 2026-08-03T06:40:05.309000+00:00
-- ended: 2026-08-03T06:40:12.362000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_lagged`
AS
SELECT
  *
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated`;
