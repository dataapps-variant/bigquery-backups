-- job_id: 883cf51a-7e82-4ee8-81a3-75edd75db66c
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-07-29T07:35:14.498000+00:00
-- started: 2026-07-29T07:35:14.699000+00:00
-- ended: 2026-07-29T07:35:14.854000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_geo_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
