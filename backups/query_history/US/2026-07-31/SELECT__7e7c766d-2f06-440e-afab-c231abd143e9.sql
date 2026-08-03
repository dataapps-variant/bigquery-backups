-- job_id: 7e7c766d-2f06-440e-afab-c231abd143e9
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:41:57.182000+00:00
-- started: 2026-07-31T12:41:57.260000+00:00
-- ended: 2026-07-31T12:41:57.360000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
