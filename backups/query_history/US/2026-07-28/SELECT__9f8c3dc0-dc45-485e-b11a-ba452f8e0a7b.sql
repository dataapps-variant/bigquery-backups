-- job_id: 9f8c3dc0-dc45-485e-b11a-ba452f8e0a7b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:30.166000+00:00
-- started: 2026-07-28T14:33:30.253000+00:00
-- ended: 2026-07-28T14:33:30.367000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT5178YT-JP' ORDER BY bc_level
