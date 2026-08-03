-- job_id: a0eb000a-d042-4486-9d3c-8b1dadbe4b98
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T08:56:06.954000+00:00
-- started: 2026-07-29T08:56:07.086000+00:00
-- ended: 2026-07-29T08:56:07.435000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
