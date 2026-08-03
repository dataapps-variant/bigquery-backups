-- job_id: bba920db-edd9-4425-9b38-7714b108f8e7
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-08-03T07:34:17.902000+00:00
-- started: 2026-08-03T07:34:18.166000+00:00
-- ended: 2026-08-03T07:34:18.334000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
