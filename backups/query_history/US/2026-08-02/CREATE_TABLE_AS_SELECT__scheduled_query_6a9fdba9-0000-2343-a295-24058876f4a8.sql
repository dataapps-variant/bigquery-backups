-- job_id: scheduled_query_6a9fdba9-0000-2343-a295-24058876f4a8
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-02T22:40:03.098000+00:00
-- started: 2026-08-02T22:40:04.643000+00:00
-- ended: 2026-08-02T22:40:11.055000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_lagged`
AS
SELECT
  *
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated`;
