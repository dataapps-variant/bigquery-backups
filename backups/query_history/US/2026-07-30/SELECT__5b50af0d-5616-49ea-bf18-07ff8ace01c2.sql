-- job_id: 5b50af0d-5616-49ea-bf18-07ff8ace01c2
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:45:51.394000+00:00
-- started: 2026-07-30T13:45:51.517000+00:00
-- ended: 2026-07-30T13:45:51.670000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
