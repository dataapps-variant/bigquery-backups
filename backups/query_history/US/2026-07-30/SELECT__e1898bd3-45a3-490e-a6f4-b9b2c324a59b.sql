-- job_id: e1898bd3-45a3-490e-a6f4-b9b2c324a59b
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T11:07:56.032000+00:00
-- started: 2026-07-30T11:07:56.165000+00:00
-- ended: 2026-07-30T11:07:56.293000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
