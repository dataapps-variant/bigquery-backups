-- job_id: 753486e9-b2a1-4f66-b43e-cd1507c89470
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:01:42.388000+00:00
-- started: 2026-07-30T12:01:42.473000+00:00
-- ended: 2026-07-30T12:01:42.573000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
