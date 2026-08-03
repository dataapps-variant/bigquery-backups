-- job_id: 6f827f7b-61fc-4619-ac98-ab1a30f12334
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-07-29T07:33:30.538000+00:00
-- started: 2026-07-29T07:33:30.754000+00:00
-- ended: 2026-07-29T07:33:30.916000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
