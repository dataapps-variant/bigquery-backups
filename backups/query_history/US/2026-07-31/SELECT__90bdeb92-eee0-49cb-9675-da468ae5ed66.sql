-- job_id: 90bdeb92-eee0-49cb-9675-da468ae5ed66
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:19:54.911000+00:00
-- started: 2026-07-31T13:19:55.032000+00:00
-- ended: 2026-07-31T13:19:55.156000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
