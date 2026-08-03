-- job_id: scheduled_query_6a9d4740-0000-2852-8e73-089e082668b0
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-03T10:40:03.488000+00:00
-- started: 2026-08-03T10:40:04.745000+00:00
-- ended: 2026-08-03T10:40:13.424000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_lagged`
AS
SELECT
  *
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated`;
