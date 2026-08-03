-- job_id: 05fa8f62-b7d5-4c8d-a377-1a52e87982c0
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-07-29T07:34:52.338000+00:00
-- started: 2026-07-29T07:34:52.536000+00:00
-- ended: 2026-07-29T07:34:52.688000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
