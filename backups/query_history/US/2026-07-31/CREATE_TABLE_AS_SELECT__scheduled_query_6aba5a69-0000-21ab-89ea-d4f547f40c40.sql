-- job_id: scheduled_query_6aba5a69-0000-21ab-89ea-d4f547f40c40
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-31T18:40:06.266000+00:00
-- started: 2026-07-31T18:40:07.516000+00:00
-- ended: 2026-07-31T18:40:15.359000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_lagged`
AS
SELECT
  *
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated`;
