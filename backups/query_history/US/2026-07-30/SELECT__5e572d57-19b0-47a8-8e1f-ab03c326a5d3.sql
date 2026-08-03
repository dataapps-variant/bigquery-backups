-- job_id: 5e572d57-19b0-47a8-8e1f-ab03c326a5d3
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T14:50:45.693000+00:00
-- started: 2026-07-30T14:50:45.862000+00:00
-- ended: 2026-07-30T14:50:45.983000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
