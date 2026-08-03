-- job_id: 323cf9bf-7920-4b4e-be68-44bb2cf974b5
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T10:46:01.484000+00:00
-- started: 2026-07-31T10:46:01.588000+00:00
-- ended: 2026-07-31T10:46:01.696000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
