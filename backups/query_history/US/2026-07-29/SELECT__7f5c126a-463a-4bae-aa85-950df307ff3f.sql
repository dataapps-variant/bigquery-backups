-- job_id: 7f5c126a-463a-4bae-aa85-950df307ff3f
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T13:14:03.276000+00:00
-- started: 2026-07-29T13:14:03.435000+00:00
-- ended: 2026-07-29T13:14:03.578000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
