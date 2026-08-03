-- job_id: faea5a87-325a-4942-ac1a-2d49cdee8cff
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:29:56.153000+00:00
-- started: 2026-07-31T12:29:56.225000+00:00
-- ended: 2026-07-31T12:29:56.448000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
