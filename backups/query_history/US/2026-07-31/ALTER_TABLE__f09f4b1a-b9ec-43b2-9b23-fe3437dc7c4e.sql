-- job_id: f09f4b1a-b9ec-43b2-9b23-fe3437dc7c4e
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-07-31T07:33:28.956000+00:00
-- started: 2026-07-31T07:33:29.154000+00:00
-- ended: 2026-07-31T07:33:29.297000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
