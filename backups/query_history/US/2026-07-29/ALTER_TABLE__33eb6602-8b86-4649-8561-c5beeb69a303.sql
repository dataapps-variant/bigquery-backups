-- job_id: 33eb6602-8b86-4649-8561-c5beeb69a303
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-07-29T07:35:06.538000+00:00
-- started: 2026-07-29T07:35:06.745000+00:00
-- ended: 2026-07-29T07:35:06.868000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
