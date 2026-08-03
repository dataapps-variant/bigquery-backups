-- job_id: job_2m6cz4g48Lyohtu6LmB01gz7jCgh
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T12:02:47.215000+00:00
-- started: 2026-07-28T12:02:47.441000+00:00
-- ended: 2026-07-28T12:02:47.701000+00:00

SELECT DISTINCT(Final_URL_suffix_AFID), Amount FROM `variant-finance-data-project.OpenAI_Ads.OpenAI_merged_final_spend`
where Date = "2026-07-27"
and App_name = "PD"
