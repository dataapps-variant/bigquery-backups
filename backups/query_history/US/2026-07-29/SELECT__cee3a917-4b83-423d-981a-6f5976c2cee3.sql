-- job_id: cee3a917-4b83-423d-981a-6f5976c2cee3
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T17:53:07.311000+00:00
-- started: 2026-07-29T17:53:07.464000+00:00
-- ended: 2026-07-29T17:53:07.694000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
