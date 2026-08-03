-- job_id: bc6a6782-6cb3-4484-bbb8-a1b409baecc7
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:53:37.099000+00:00
-- started: 2026-07-29T09:53:37.217000+00:00
-- ended: 2026-07-29T09:53:37.401000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
