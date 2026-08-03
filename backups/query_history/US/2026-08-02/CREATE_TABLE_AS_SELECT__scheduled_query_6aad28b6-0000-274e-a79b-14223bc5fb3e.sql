-- job_id: scheduled_query_6aad28b6-0000-274e-a79b-14223bc5fb3e
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-02T12:40:05.142000+00:00
-- started: 2026-08-02T12:40:06.364000+00:00
-- ended: 2026-08-02T12:40:15.662000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_lagged`
AS
SELECT
  *
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated`;
