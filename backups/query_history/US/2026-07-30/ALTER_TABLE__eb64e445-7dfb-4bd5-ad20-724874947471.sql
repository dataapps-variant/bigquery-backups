-- job_id: eb64e445-7dfb-4bd5-ad20-724874947471
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-07-30T07:33:27.181000+00:00
-- started: 2026-07-30T07:33:27.400000+00:00
-- ended: 2026-07-30T07:33:27.539000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
