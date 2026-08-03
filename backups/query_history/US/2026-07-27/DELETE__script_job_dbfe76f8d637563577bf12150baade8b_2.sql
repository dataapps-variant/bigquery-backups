-- job_id: script_job_dbfe76f8d637563577bf12150baade8b_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-27T19:40:08.611000+00:00
-- started: 2026-07-27T19:40:09.164000+00:00
-- ended: 2026-07-27T19:40:10.127000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
