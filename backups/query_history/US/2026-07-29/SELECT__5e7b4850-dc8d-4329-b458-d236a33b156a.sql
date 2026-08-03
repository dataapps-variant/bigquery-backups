-- job_id: 5e7b4850-dc8d-4329-b458-d236a33b156a
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T17:53:13.370000+00:00
-- started: 2026-07-29T17:53:13.454000+00:00
-- ended: 2026-07-29T17:53:13.691000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
