-- job_id: 724a5bc4-3695-4d19-af6e-9def349408dd
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T11:08:02.129000+00:00
-- started: 2026-07-30T11:08:02.231000+00:00
-- ended: 2026-07-30T11:08:02.310000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
