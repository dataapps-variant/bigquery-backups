-- job_id: 5f124b02-9312-4629-87dc-3b879bb54b36
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:53:37.069000+00:00
-- started: 2026-07-29T09:53:37.169000+00:00
-- ended: 2026-07-29T09:53:37.348000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
