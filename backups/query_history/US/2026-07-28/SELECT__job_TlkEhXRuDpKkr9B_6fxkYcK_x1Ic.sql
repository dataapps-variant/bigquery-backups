-- job_id: job_TlkEhXRuDpKkr9B_6fxkYcK_x1Ic
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T12:02:42.287000+00:00
-- started: 2026-07-28T12:02:42.542000+00:00
-- ended: 2026-07-28T12:02:42.774000+00:00

SELECT DISTINCT(Final_URL_suffix_AFID), Amount FROM `variant-finance-data-project.OpenAI_Ads.OpenAI_merged_final_spend`
where Date = "2026-07-27"
and App_name = "Pd"
