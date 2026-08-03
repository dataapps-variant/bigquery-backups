-- job_id: 5c5e785d-2e69-41d0-b2cf-642d8a60cac6
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:22:29.006000+00:00
-- started: 2026-08-03T12:22:29.084000+00:00
-- ended: 2026-08-03T12:22:29.249000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD2995STMT' ORDER BY bc_level
