-- job_id: 4cf5353f-40cf-4a95-8f0e-d1a7f1cb48b4
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:23.284000+00:00
-- started: 2026-08-03T12:27:23.410000+00:00
-- ended: 2026-08-03T12:27:23.586000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'MB6373YT' ORDER BY bc_level
