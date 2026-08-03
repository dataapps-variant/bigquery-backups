-- job_id: d33d69ff-b2a6-4e39-9f6d-907ea46cf68f
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:56:24.620000+00:00
-- started: 2026-07-29T09:56:24.689000+00:00
-- ended: 2026-07-29T09:56:24.777000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
