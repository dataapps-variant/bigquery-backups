-- job_id: scheduled_query_6a8fd5f0-0000-2535-a1a3-089e0831bf14
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-01T00:40:05.846000+00:00
-- started: 2026-08-01T00:40:06.996000+00:00
-- ended: 2026-08-01T00:40:14.207000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_lagged`
AS
SELECT
  *
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated`;
