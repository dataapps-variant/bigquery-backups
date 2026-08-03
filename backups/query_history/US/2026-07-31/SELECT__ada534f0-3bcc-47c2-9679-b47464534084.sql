-- job_id: ada534f0-3bcc-47c2-9679-b47464534084
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:00:33.444000+00:00
-- started: 2026-07-31T13:00:33.551000+00:00
-- ended: 2026-07-31T13:00:33.692000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
