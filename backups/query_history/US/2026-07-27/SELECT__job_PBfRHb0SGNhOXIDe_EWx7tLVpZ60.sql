-- job_id: job_PBfRHb0SGNhOXIDe_EWx7tLVpZ60
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T13:22:36.389000+00:00
-- started: 2026-07-27T13:22:36.638000+00:00
-- ended: 2026-07-27T13:22:43.705000+00:00

SELECT COUNT(*) AS live_rows, MAX(Date) AS max_date
FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend`;
