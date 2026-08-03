-- job_id: 0259b864-1305-499d-9de5-7d44a17af0c2
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T22:00:40.759000+00:00
-- started: 2026-07-31T22:00:40.905000+00:00
-- ended: 2026-07-31T22:00:41.039000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
