-- job_id: scheduled_query_6a81c49b-0000-2191-a113-fc4116926309
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-31T22:40:05.825000+00:00
-- started: 2026-07-31T22:40:06.873000+00:00
-- ended: 2026-07-31T22:40:12.673000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_lagged`
AS
SELECT
  *
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated`;
