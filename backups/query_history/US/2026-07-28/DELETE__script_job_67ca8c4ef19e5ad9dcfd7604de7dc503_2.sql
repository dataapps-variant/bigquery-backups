-- job_id: script_job_67ca8c4ef19e5ad9dcfd7604de7dc503_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T04:40:05.812000+00:00
-- started: 2026-07-28T04:40:06.320000+00:00
-- ended: 2026-07-28T04:40:07.325000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
