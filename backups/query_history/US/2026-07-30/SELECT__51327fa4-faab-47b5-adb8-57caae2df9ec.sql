-- job_id: 51327fa4-faab-47b5-adb8-57caae2df9ec
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T21:26:02.915000+00:00
-- started: 2026-07-30T21:26:03.041000+00:00
-- ended: 2026-07-30T21:26:03.203000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
