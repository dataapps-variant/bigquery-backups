-- job_id: 3c4c9c9f-ef6a-4f6c-bcc0-2ce1face84ef
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T13:06:28.616000+00:00
-- started: 2026-07-29T13:06:28.750000+00:00
-- ended: 2026-07-29T13:06:29.015000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
