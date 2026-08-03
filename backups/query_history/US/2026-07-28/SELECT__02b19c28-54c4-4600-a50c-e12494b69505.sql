-- job_id: 02b19c28-54c4-4600-a50c-e12494b69505
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:46.346000+00:00
-- started: 2026-07-28T10:04:46.433000+00:00
-- ended: 2026-07-28T10:04:46.581000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'MB5178YT' ORDER BY bc_level
