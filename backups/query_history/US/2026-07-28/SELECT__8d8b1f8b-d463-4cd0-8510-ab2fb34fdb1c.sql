-- job_id: 8d8b1f8b-d463-4cd0-8510-ab2fb34fdb1c
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:47:12.076000+00:00
-- started: 2026-07-28T14:47:12.147000+00:00
-- ended: 2026-07-28T14:47:12.424000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
