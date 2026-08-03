-- job_id: d1bd7bba-534e-4c1a-9bbd-21068a6ddaf0
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-07-31T07:35:12.131000+00:00
-- started: 2026-07-31T07:35:12.330000+00:00
-- ended: 2026-07-31T07:35:12.485000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_geo_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
