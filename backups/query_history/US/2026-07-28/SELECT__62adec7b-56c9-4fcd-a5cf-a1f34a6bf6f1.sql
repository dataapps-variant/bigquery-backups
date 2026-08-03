-- job_id: 62adec7b-56c9-4fcd-a5cf-a1f34a6bf6f1
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:13.559000+00:00
-- started: 2026-07-28T14:33:13.646000+00:00
-- ended: 2026-07-28T14:33:13.781000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT2788YT-JP' ORDER BY bc_level
