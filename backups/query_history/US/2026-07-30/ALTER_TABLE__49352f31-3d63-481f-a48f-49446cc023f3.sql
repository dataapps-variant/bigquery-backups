-- job_id: 49352f31-3d63-481f-a48f-49446cc023f3
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-07-30T07:34:54.911000+00:00
-- started: 2026-07-30T07:34:55.094000+00:00
-- ended: 2026-07-30T07:34:55.214000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
