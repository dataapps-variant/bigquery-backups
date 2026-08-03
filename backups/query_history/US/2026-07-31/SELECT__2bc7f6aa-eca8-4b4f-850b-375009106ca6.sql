-- job_id: 2bc7f6aa-eca8-4b4f-850b-375009106ca6
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T14:00:20.349000+00:00
-- started: 2026-07-31T14:00:20.445000+00:00
-- ended: 2026-07-31T14:00:20.550000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
