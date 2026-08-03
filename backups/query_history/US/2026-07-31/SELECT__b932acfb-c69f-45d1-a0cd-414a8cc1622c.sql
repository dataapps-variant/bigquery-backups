-- job_id: b932acfb-c69f-45d1-a0cd-414a8cc1622c
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:47:55.554000+00:00
-- started: 2026-07-31T16:47:55.650000+00:00
-- ended: 2026-07-31T16:47:55.748000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
