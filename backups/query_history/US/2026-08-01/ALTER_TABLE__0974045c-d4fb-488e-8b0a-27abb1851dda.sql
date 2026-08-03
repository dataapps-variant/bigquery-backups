-- job_id: 0974045c-d4fb-488e-8b0a-27abb1851dda
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-08-01T07:33:17.601000+00:00
-- started: 2026-08-01T07:33:17.803000+00:00
-- ended: 2026-08-01T07:33:17.940000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
