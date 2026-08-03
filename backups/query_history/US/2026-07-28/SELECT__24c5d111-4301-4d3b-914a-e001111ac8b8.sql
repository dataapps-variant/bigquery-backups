-- job_id: 24c5d111-4301-4d3b-914a-e001111ac8b8
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:10:37.797000+00:00
-- started: 2026-07-28T13:10:38.203000+00:00
-- ended: 2026-07-28T13:10:39.502000+00:00


    SELECT COUNT(*) AS n, COUNT(DISTINCT Input_ID) AS inputs, ROUND(SUM(spend_usd), 2) AS spend
    FROM `variant-finance-data-project.R100.R100_Historical_Spend`
