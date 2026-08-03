-- job_id: 8e72a3a9-3681-48ae-9204-eacab131591c
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-07-28T07:33:45.321000+00:00
-- started: 2026-07-28T07:33:45.513000+00:00
-- ended: 2026-07-28T07:33:45.647000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_geo_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
