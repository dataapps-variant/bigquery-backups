-- job_id: 7b7f0c3e-bdba-4892-9344-b76189314cb3
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:47:55.297000+00:00
-- started: 2026-07-31T16:47:55.394000+00:00
-- ended: 2026-07-31T16:47:55.565000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
