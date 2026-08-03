-- job_id: de42b95f-282d-4fdc-add1-c69d7b575116
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-07-31T07:35:06.181000+00:00
-- started: 2026-07-31T07:35:06.364000+00:00
-- ended: 2026-07-31T07:35:06.532000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
