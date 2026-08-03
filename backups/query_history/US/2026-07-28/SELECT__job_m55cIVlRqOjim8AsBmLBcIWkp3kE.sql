-- job_id: job_m55cIVlRqOjim8AsBmLBcIWkp3kE
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T11:22:07.532000+00:00
-- started: 2026-07-28T11:22:07.615000+00:00
-- ended: 2026-07-28T11:22:07.795000+00:00

SELECT COUNT(*) n, COUNTIF(Country_Code IS NOT NULL) with_country FROM `variant-finance-data-project.R100.R100_Input_Selection`
