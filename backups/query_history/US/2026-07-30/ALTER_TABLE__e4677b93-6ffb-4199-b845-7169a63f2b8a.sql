-- job_id: e4677b93-6ffb-4199-b845-7169a63f2b8a
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-07-30T07:35:02.124000+00:00
-- started: 2026-07-30T07:35:02.357000+00:00
-- ended: 2026-07-30T07:35:02.499000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_geo_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
