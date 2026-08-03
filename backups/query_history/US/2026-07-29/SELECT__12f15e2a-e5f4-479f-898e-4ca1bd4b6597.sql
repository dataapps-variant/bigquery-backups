-- job_id: 12f15e2a-e5f4-479f-898e-4ca1bd4b6597
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:35:23.046000+00:00
-- started: 2026-07-29T09:35:23.137000+00:00
-- ended: 2026-07-29T09:35:23.328000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
