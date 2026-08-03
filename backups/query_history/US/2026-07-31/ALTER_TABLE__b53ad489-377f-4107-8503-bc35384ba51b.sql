-- job_id: b53ad489-377f-4107-8503-bc35384ba51b
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-07-31T07:33:22.273000+00:00
-- started: 2026-07-31T07:33:22.489000+00:00
-- ended: 2026-07-31T07:33:22.637000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
