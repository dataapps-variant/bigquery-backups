-- job_id: 83c7bc46-24e4-4f85-b36e-80b23e44acb9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:25.222000+00:00
-- started: 2026-08-03T12:23:25.310000+00:00
-- ended: 2026-08-03T12:23:25.505000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CN3400ST' ORDER BY bc_level
