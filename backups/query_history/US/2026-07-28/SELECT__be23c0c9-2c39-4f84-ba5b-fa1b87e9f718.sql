-- job_id: be23c0c9-2c39-4f84-ba5b-fa1b87e9f718
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:46:51.078000+00:00
-- started: 2026-07-28T14:46:51.235000+00:00
-- ended: 2026-07-28T14:46:51.369000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
