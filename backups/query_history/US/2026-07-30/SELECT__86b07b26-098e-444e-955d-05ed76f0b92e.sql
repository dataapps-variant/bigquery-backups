-- job_id: 86b07b26-098e-444e-955d-05ed76f0b92e
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T14:01:41.813000+00:00
-- started: 2026-07-30T14:01:41.987000+00:00
-- ended: 2026-07-30T14:01:42.190000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
