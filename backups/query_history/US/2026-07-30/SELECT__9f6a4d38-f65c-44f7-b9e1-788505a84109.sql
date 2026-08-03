-- job_id: 9f6a4d38-f65c-44f7-b9e1-788505a84109
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T23:53:03.640000+00:00
-- started: 2026-07-30T23:53:03.761000+00:00
-- ended: 2026-07-30T23:53:03.880000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
