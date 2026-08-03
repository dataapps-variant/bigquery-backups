-- job_id: c07d5d08-ee45-409d-938f-3767b459c9f9
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-07-30T07:34:48.121000+00:00
-- started: 2026-07-30T07:34:48.342000+00:00
-- ended: 2026-07-30T07:34:48.488000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
