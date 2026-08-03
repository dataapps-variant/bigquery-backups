-- job_id: scheduled_query_6aa2fc4b-0000-2343-a295-24058876f4a8
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-03T07:40:06.566000+00:00
-- started: 2026-08-03T07:40:07.662000+00:00
-- ended: 2026-08-03T07:40:15.372000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_lagged`
AS
SELECT
  *
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated`;
