-- job_id: d6bf5d7a-1afe-412d-85bd-640c0b865193
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T21:25:57.782000+00:00
-- started: 2026-07-30T21:25:57.937000+00:00
-- ended: 2026-07-30T21:25:58.091000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
