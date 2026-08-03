-- job_id: scheduled_query_6a82b73e-0000-2191-a113-fc4116926309
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-01T02:40:07.177000+00:00
-- started: 2026-08-01T02:40:08.036000+00:00
-- ended: 2026-08-01T02:40:15.151000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_lagged`
AS
SELECT
  *
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated`;
