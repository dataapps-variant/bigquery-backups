-- job_id: 56c39102-c9a6-4f23-8bed-020ca8703a24
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:45.085000+00:00
-- started: 2026-07-28T10:05:45.140000+00:00
-- ended: 2026-07-28T10:05:45.258000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT2788YT-Non-JP' ORDER BY bc_level
