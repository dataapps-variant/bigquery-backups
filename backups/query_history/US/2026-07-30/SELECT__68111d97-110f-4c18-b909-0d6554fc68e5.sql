-- job_id: 68111d97-110f-4c18-b909-0d6554fc68e5
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T23:52:58.705000+00:00
-- started: 2026-07-30T23:52:58.822000+00:00
-- ended: 2026-07-30T23:52:58.942000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
