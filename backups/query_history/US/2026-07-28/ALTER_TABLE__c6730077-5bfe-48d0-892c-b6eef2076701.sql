-- job_id: c6730077-5bfe-48d0-892c-b6eef2076701
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-07-28T07:33:38.668000+00:00
-- started: 2026-07-28T07:33:38.887000+00:00
-- ended: 2026-07-28T07:33:39.014000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
