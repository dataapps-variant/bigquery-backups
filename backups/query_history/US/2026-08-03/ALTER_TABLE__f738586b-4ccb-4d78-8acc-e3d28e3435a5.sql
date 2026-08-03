-- job_id: f738586b-4ccb-4d78-8acc-e3d28e3435a5
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-08-03T07:35:37.594000+00:00
-- started: 2026-08-03T07:35:37.872000+00:00
-- ended: 2026-08-03T07:35:38.033000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
