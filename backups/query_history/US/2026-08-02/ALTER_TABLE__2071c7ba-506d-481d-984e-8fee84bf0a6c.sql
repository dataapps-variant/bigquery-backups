-- job_id: 2071c7ba-506d-481d-984e-8fee84bf0a6c
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: ALTER_TABLE
-- created: 2026-08-02T07:34:30.805000+00:00
-- started: 2026-08-02T07:34:31.012000+00:00
-- ended: 2026-08-02T07:34:31.162000+00:00

ALTER TABLE `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report` ADD COLUMN IF NOT EXISTS `Account name` STRING
