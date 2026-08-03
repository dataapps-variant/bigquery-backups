-- job_id: f215b618-4b52-4875-a911-42cde60f27be
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T11:08:01.646000+00:00
-- started: 2026-07-30T11:08:01.752000+00:00
-- ended: 2026-07-30T11:08:01.882000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
