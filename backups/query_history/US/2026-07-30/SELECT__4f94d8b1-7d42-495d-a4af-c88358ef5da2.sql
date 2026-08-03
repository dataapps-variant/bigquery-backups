-- job_id: 4f94d8b1-7d42-495d-a4af-c88358ef5da2
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:01:41.258000+00:00
-- started: 2026-07-30T12:01:41.341000+00:00
-- ended: 2026-07-30T12:01:41.473000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
