-- job_id: 5f6557a5-0831-4cb5-80f8-d9790239d888
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:30.042000+00:00
-- started: 2026-07-28T10:05:30.133000+00:00
-- ended: 2026-07-28T10:05:30.223000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT5178YT-JP' ORDER BY bc_level
