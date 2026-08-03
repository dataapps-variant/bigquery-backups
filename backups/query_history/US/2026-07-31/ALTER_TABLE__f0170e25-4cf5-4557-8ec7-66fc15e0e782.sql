-- job_id: f0170e25-4cf5-4557-8ec7-66fc15e0e782
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-07-31T07:35:00.037000+00:00
-- started: 2026-07-31T07:35:00.262000+00:00
-- ended: 2026-07-31T07:35:00.448000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
