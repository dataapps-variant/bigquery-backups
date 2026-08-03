-- job_id: 3b945576-8b61-4b76-af53-3c8da065306c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:18.571000+00:00
-- started: 2026-08-03T12:27:18.655000+00:00
-- ended: 2026-08-03T12:27:18.793000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'MB2788YT' ORDER BY bc_level
