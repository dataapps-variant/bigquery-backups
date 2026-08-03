-- job_id: 075d978d-8913-48d4-b31a-d84d24cbf268
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-07-31T07:33:36.765000+00:00
-- started: 2026-07-31T07:33:36.939000+00:00
-- ended: 2026-07-31T07:33:37.125000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_geo_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
