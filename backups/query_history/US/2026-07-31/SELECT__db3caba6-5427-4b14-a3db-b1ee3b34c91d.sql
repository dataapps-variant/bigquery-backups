-- job_id: db3caba6-5427-4b14-a3db-b1ee3b34c91d
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:00:40.155000+00:00
-- started: 2026-07-31T13:00:40.280000+00:00
-- ended: 2026-07-31T13:00:40.416000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
