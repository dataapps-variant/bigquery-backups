-- job_id: scheduled_query_6a96b0dc-0000-268c-9e95-ac3eb15e268c
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-31T17:40:06.885000+00:00
-- started: 2026-07-31T17:40:07.754000+00:00
-- ended: 2026-07-31T17:40:15.532000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_lagged`
AS
SELECT
  *
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated`;
