-- job_id: e8906a3e-06ad-4584-b286-d1e872396bc6
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-07-28T07:33:31.304000+00:00
-- started: 2026-07-28T07:33:31.657000+00:00
-- ended: 2026-07-28T07:33:31.780000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
