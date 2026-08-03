-- job_id: scheduled_query_6a92be1b-0000-2fd9-ad59-30fd3813e120
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-01T16:40:06.225000+00:00
-- started: 2026-08-01T16:40:07.436000+00:00
-- ended: 2026-08-01T16:40:14.710000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_lagged`
AS
SELECT
  *
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated`;
