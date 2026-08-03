-- job_id: fa6bb206-4b16-4b88-ab9a-beb47f145ba5
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-08-02T07:33:28.623000+00:00
-- started: 2026-08-02T07:33:28.825000+00:00
-- ended: 2026-08-02T07:33:28.954000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
