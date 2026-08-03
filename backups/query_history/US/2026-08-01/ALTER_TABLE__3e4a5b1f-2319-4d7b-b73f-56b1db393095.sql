-- job_id: 3e4a5b1f-2319-4d7b-b73f-56b1db393095
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-08-01T07:34:43.162000+00:00
-- started: 2026-08-01T07:34:43.366000+00:00
-- ended: 2026-08-01T07:34:43.487000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
