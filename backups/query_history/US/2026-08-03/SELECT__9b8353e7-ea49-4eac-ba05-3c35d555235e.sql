-- job_id: 9b8353e7-ea49-4eac-ba05-3c35d555235e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:22:34.567000+00:00
-- started: 2026-08-03T12:22:34.613000+00:00
-- ended: 2026-08-03T12:22:34.799000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD1440AD' ORDER BY bc_level
