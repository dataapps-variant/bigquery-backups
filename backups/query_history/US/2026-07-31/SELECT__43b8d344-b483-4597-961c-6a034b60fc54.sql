-- job_id: 43b8d344-b483-4597-961c-6a034b60fc54
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T15:36:15.915000+00:00
-- started: 2026-07-31T15:36:16.103000+00:00
-- ended: 2026-07-31T15:36:16.191000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
