-- job_id: c4025788-953a-4d99-9ccd-59cb3239d609
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-08-02T07:33:22.122000+00:00
-- started: 2026-08-02T07:33:22.339000+00:00
-- ended: 2026-08-02T07:33:22.477000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
