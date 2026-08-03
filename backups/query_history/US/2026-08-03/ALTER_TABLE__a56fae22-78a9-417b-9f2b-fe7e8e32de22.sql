-- job_id: a56fae22-78a9-417b-9f2b-fe7e8e32de22
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-08-03T07:34:37.769000+00:00
-- started: 2026-08-03T07:34:37.975000+00:00
-- ended: 2026-08-03T07:34:38.115000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_geo_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
