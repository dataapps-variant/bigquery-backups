-- job_id: d0965fff-0630-4a9a-90a4-21b31997de92
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:53:37.053000+00:00
-- started: 2026-07-29T09:53:37.200000+00:00
-- ended: 2026-07-29T09:53:37.372000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
