-- job_id: 49bcc762-1c7b-4252-bd3d-b96504ba7d33
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:54:50.596000+00:00
-- started: 2026-08-03T12:54:50.688000+00:00
-- ended: 2026-08-03T12:54:50.803000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
