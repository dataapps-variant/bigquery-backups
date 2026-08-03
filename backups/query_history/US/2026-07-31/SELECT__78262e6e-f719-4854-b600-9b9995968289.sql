-- job_id: 78262e6e-f719-4854-b600-9b9995968289
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:30:02.799000+00:00
-- started: 2026-07-31T12:30:02.885000+00:00
-- ended: 2026-07-31T12:30:03.133000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
