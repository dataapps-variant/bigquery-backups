-- job_id: 3aabb7ce-4cc9-4a75-9a12-e8ca0631f776
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T10:03:33.649000+00:00
-- started: 2026-07-31T10:03:33.762000+00:00
-- ended: 2026-07-31T10:03:34.001000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
