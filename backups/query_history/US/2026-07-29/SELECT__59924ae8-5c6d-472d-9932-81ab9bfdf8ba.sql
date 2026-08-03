-- job_id: 59924ae8-5c6d-472d-9932-81ab9bfdf8ba
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T17:35:39.163000+00:00
-- started: 2026-07-29T17:35:39.274000+00:00
-- ended: 2026-07-29T17:35:39.380000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
