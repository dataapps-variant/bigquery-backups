-- job_id: scheduled_query_6ac9af36-0000-2fa5-bcfc-240588731210
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-03T08:40:03.475000+00:00
-- started: 2026-08-03T08:40:04.952000+00:00
-- ended: 2026-08-03T08:40:12.227000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_lagged`
AS
SELECT
  *
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated`;
