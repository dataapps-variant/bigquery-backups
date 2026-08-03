-- job_id: job_JJ4cNtHfsUvVMhezNws7fcXsILst
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T13:20:32.606000+00:00
-- started: 2026-07-27T13:20:32.696000+00:00
-- ended: 2026-07-27T13:20:43.060000+00:00

SELECT snapshot_id, COUNT(*) AS row_s, MAX(Date) AS max_data_date,
       MAX(snapshot_timestamp) AS captured
FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
GROUP BY snapshot_id
