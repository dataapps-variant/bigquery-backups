-- job_id: f3f984e6-3087-4d38-b784-9d68dd11265f
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-07-29T07:33:23.890000+00:00
-- started: 2026-07-29T07:33:24.097000+00:00
-- ended: 2026-07-29T07:33:24.240000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
