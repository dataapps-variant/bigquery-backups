-- job_id: 4da093c7-e8f1-4395-b9a7-e6c477008a3a
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-08-03T07:34:30.410000+00:00
-- started: 2026-08-03T07:34:30.804000+00:00
-- ended: 2026-08-03T07:34:30.936000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
