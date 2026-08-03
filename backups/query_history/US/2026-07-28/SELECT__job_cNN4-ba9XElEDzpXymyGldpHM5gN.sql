-- job_id: job_cNN4-ba9XElEDzpXymyGldpHM5gN
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:22:27.820000+00:00
-- started: 2026-07-28T11:22:27.909000+00:00
-- ended: 2026-07-28T11:22:28.275000+00:00

SELECT sum(amount) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_1hr_lagged` where date = "2026-07-28"
