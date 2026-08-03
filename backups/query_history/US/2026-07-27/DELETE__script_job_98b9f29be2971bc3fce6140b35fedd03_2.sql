-- job_id: script_job_98b9f29be2971bc3fce6140b35fedd03_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-27T14:03:43.036000+00:00
-- started: 2026-07-27T14:03:43.415000+00:00
-- ended: 2026-07-27T14:03:44.828000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
