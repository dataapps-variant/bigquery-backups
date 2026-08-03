-- job_id: 5ad59ebe-478c-4847-9104-ac27337d7048
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T10:54:04.643000+00:00
-- started: 2026-07-30T10:54:04.742000+00:00
-- ended: 2026-07-30T10:54:04.868000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
