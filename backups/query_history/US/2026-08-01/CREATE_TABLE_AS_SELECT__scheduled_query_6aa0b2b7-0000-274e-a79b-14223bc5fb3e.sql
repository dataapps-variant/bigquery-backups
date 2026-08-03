-- job_id: scheduled_query_6aa0b2b7-0000-274e-a79b-14223bc5fb3e
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-01T10:40:03.750000+00:00
-- started: 2026-08-01T10:40:04.873000+00:00
-- ended: 2026-08-01T10:40:13.856000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_lagged`
AS
SELECT
  *
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated`;
