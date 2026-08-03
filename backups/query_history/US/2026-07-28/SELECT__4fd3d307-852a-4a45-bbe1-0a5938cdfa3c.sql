-- job_id: 4fd3d307-852a-4a45-bbe1-0a5938cdfa3c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:30:48.509000+00:00
-- started: 2026-07-28T14:30:48.605000+00:00
-- ended: 2026-07-28T14:30:48.708000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'AT2788YT' ORDER BY bc_level
