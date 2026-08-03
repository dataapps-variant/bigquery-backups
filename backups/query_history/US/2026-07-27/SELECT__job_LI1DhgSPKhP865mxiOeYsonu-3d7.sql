-- job_id: job_LI1DhgSPKhP865mxiOeYsonu-3d7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T13:18:50.046000+00:00
-- started: 2026-07-27T13:18:50.127000+00:00
-- ended: 2026-07-27T13:18:53.855000+00:00

-- the snapshot the view WOULD pick:
WITH best_snapshot AS (
  SELECT snapshot_id,
         ROW_NUMBER() OVER (ORDER BY captured_at DESC) AS rn
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  WHERE status = 'COMPLETE'
    AND captured_at <= TIMESTAMP_SUB(current_timestamp, INTERVAL 45 MINUTE)
)
SELECT bs.snapshot_id,
       COUNT(h.snapshot_id) AS rows_in_history
FROM best_snapshot bs
LEFT JOIN `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` h
  ON h.snapshot_id = bs.snapshot_id
WHERE bs.rn = 1
GROUP BY bs.snapshot_id;
