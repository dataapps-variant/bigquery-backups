-- job_id: 7a0a6634-1cdd-4cf3-b969-37501f45f5f7
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:22:39.847000+00:00
-- started: 2026-08-03T12:22:39.925000+00:00
-- ended: 2026-08-03T12:22:40.137000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD2000AD' ORDER BY bc_level
