-- job_id: scheduled_query_6aa17d7b-0000-268c-9e95-ac3eb15e268c
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-01T14:40:06.536000+00:00
-- started: 2026-08-01T14:40:08.091000+00:00
-- ended: 2026-08-01T14:40:15.753000+00:00

CREATE OR REPLACE TABLE
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated_lagged`
AS
SELECT
  *
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated`;
