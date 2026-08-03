-- job_id: 4ff97750-270b-47a9-88da-6da7f48e2c6c
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-08-02T07:34:38.133000+00:00
-- started: 2026-08-02T07:34:38.330000+00:00
-- ended: 2026-08-02T07:34:38.456000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
