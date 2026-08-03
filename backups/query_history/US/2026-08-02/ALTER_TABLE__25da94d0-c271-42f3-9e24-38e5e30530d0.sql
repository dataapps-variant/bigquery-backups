-- job_id: 25da94d0-c271-42f3-9e24-38e5e30530d0
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-08-02T07:33:34.836000+00:00
-- started: 2026-08-02T07:33:35.032000+00:00
-- ended: 2026-08-02T07:33:35.160000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_geo_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
