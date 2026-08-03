-- job_id: 44c603d8-b380-4fb8-9a63-20ef20244268
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T17:27:03.139000+00:00
-- started: 2026-07-29T17:27:03.240000+00:00
-- ended: 2026-07-29T17:27:03.374000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
