-- job_id: c8610cc6-8149-47b7-933b-4ef83f0f6afa
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-08-03T07:35:44.880000+00:00
-- started: 2026-08-03T07:35:45.054000+00:00
-- ended: 2026-08-03T07:35:45.211000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
