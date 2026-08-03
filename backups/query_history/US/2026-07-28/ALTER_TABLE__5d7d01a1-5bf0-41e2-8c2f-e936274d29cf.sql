-- job_id: 5d7d01a1-5bf0-41e2-8c2f-e936274d29cf
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-07-28T07:35:01.580000+00:00
-- started: 2026-07-28T07:35:01.793000+00:00
-- ended: 2026-07-28T07:35:01.961000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_geo_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
