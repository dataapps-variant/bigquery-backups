-- job_id: scheduled_query_6a92d1ab-0000-2535-a1a3-089e0831bf14
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-01T06:40:05.287000+00:00
-- started: 2026-08-01T06:40:06.425000+00:00
-- ended: 2026-08-01T06:40:13.003000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_lagged`
AS
SELECT
  *
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated`;
