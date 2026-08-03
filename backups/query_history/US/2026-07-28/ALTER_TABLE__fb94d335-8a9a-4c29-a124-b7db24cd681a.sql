-- job_id: fb94d335-8a9a-4c29-a124-b7db24cd681a
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-07-28T07:34:46.758000+00:00
-- started: 2026-07-28T07:34:47.095000+00:00
-- ended: 2026-07-28T07:34:47.222000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
