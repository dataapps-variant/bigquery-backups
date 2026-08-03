-- job_id: 7a27c961-f942-4112-b1fd-d3e1f1deaed2
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-08-01T07:33:26.568000+00:00
-- started: 2026-08-01T07:33:26.768000+00:00
-- ended: 2026-08-01T07:33:26.910000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
