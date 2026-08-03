-- job_id: ec205bc4-08d6-4554-b6c0-43ece37a7d49
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T13:14:08.387000+00:00
-- started: 2026-07-29T13:14:08.500000+00:00
-- ended: 2026-07-29T13:14:08.611000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
