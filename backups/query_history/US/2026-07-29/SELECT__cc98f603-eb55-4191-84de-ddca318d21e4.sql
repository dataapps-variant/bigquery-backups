-- job_id: cc98f603-eb55-4191-84de-ddca318d21e4
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:56:24.585000+00:00
-- started: 2026-07-29T09:56:24.656000+00:00
-- ended: 2026-07-29T09:56:24.774000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
