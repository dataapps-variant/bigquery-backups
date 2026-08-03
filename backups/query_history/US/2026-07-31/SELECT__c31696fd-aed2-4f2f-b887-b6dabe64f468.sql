-- job_id: c31696fd-aed2-4f2f-b887-b6dabe64f468
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T15:36:09.682000+00:00
-- started: 2026-07-31T15:36:09.783000+00:00
-- ended: 2026-07-31T15:36:09.873000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
