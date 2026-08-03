-- job_id: scheduled_query_6a9061d3-0000-2343-a295-24058876f4a8
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-01T03:40:04.785000+00:00
-- started: 2026-08-01T03:40:06.346000+00:00
-- ended: 2026-08-01T03:40:13.381000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_lagged`
AS
SELECT
  *
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated`;
