-- job_id: scheduled_query_6ae19fed-0000-21ab-89ea-d4f547f40c40
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-02T15:40:05.395000+00:00
-- started: 2026-08-02T15:40:06.739000+00:00
-- ended: 2026-08-02T15:40:13.554000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_lagged`
AS
SELECT
  *
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated`;
