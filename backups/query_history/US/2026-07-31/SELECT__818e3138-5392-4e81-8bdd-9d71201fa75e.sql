-- job_id: 818e3138-5392-4e81-8bdd-9d71201fa75e
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T14:00:25.248000+00:00
-- started: 2026-07-31T14:00:25.360000+00:00
-- ended: 2026-07-31T14:00:25.466000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
