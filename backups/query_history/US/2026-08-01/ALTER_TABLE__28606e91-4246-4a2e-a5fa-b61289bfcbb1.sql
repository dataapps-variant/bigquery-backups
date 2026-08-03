-- job_id: 28606e91-4246-4a2e-a5fa-b61289bfcbb1
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-08-01T07:34:50.837000+00:00
-- started: 2026-08-01T07:34:51.002000+00:00
-- ended: 2026-08-01T07:34:51.147000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
