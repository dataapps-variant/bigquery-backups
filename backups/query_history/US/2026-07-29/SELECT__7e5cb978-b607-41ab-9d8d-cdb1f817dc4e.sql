-- job_id: 7e5cb978-b607-41ab-9d8d-cdb1f817dc4e
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T19:36:47.754000+00:00
-- started: 2026-07-29T19:36:47.918000+00:00
-- ended: 2026-07-29T19:36:48.027000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
