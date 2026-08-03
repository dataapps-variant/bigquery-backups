-- job_id: ab1a250f-88f6-4fbb-9587-0c3551ca32bc
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T14:00:24.975000+00:00
-- started: 2026-07-31T14:00:25.096000+00:00
-- ended: 2026-07-31T14:00:25.237000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
