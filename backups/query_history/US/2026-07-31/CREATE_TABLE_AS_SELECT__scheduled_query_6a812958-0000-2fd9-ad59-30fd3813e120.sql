-- job_id: scheduled_query_6a812958-0000-2fd9-ad59-30fd3813e120
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-31T17:24:49.419000+00:00
-- started: 2026-07-31T17:24:50.568000+00:00
-- ended: 2026-07-31T17:24:57.351000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_lagged`
AS
SELECT
  *
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated`;
