-- job_id: bquxjob_4c7ae0e2_19fb7ea8abb
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-31T11:23:50.534000+00:00
-- started: 2026-07-31T11:23:51.933000+00:00
-- ended: 2026-07-31T11:23:59.623000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_Lagged`
AS
SELECT *
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated`;
