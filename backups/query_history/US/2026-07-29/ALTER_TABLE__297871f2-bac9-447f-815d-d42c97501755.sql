-- job_id: 297871f2-bac9-447f-815d-d42c97501755
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-07-29T07:33:38.220000+00:00
-- started: 2026-07-29T07:33:38.418000+00:00
-- ended: 2026-07-29T07:33:38.552000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_geo_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
