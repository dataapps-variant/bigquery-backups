-- job_id: scheduled_query_6a9794d2-0000-2343-a295-24058876f4a8
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-01T22:40:07.924000+00:00
-- started: 2026-08-01T22:40:09.077000+00:00
-- ended: 2026-08-01T22:40:15.319000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_lagged`
AS
SELECT
  *
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated`;
