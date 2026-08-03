-- job_id: 7a071b24-d0f2-46d1-9a6c-c0f72f3105ee
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-07-30T07:33:33.883000+00:00
-- started: 2026-07-30T07:33:34.094000+00:00
-- ended: 2026-07-30T07:33:34.248000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
