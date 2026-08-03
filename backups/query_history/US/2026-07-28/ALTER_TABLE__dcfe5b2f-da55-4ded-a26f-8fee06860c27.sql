-- job_id: dcfe5b2f-da55-4ded-a26f-8fee06860c27
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-07-28T07:34:54.978000+00:00
-- started: 2026-07-28T07:34:55.203000+00:00
-- ended: 2026-07-28T07:34:55.325000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
