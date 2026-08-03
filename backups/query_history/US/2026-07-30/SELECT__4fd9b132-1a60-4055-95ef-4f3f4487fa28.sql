-- job_id: 4fd9b132-1a60-4055-95ef-4f3f4487fa28
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T16:42:33.107000+00:00
-- started: 2026-07-30T16:42:33.228000+00:00
-- ended: 2026-07-30T16:42:33.366000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
