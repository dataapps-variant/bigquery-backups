-- job_id: 266a21e6-a811-499e-a4e0-9a4f28b62038
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T14:50:50.318000+00:00
-- started: 2026-07-30T14:50:50.427000+00:00
-- ended: 2026-07-30T14:50:50.541000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
