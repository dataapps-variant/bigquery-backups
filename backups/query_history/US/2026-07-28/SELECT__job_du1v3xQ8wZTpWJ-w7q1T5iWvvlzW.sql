-- job_id: job_du1v3xQ8wZTpWJ-w7q1T5iWvvlzW
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T12:02:20.074000+00:00
-- started: 2026-07-28T12:02:20.344000+00:00
-- ended: 2026-07-28T12:02:20.545000+00:00

SELECT DISTINCT(Final_URL_suffix_AFID), Amount FROM `variant-finance-data-project.OpenAI_Ads.OpenAI_merged_final_spend`
where Date = "2026-07-27"
