-- job_id: 5c4e97fd-e0f2-44ee-a76d-efe8f556e149
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:54:34.723000+00:00
-- started: 2026-07-29T09:54:34.815000+00:00
-- ended: 2026-07-29T09:54:34.924000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
