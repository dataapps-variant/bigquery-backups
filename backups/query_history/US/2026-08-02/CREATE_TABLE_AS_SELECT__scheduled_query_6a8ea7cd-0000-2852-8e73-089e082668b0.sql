-- job_id: scheduled_query_6a8ea7cd-0000-2852-8e73-089e082668b0
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-02T07:40:08.602000+00:00
-- started: 2026-08-02T07:40:10.059000+00:00
-- ended: 2026-08-02T07:40:17.929000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_lagged`
AS
SELECT
  *
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated`;
