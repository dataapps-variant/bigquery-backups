-- job_id: 1985c037-3d88-4f5f-a89f-839031eebe87
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:01:37.588000+00:00
-- started: 2026-07-30T12:01:37.683000+00:00
-- ended: 2026-07-30T12:01:37.786000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
