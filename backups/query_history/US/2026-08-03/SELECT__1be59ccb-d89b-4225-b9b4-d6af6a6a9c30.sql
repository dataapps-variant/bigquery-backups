-- job_id: 1be59ccb-d89b-4225-b9b4-d6af6a6a9c30
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:18.911000+00:00
-- started: 2026-08-03T12:25:18.996000+00:00
-- ended: 2026-08-03T12:25:19.171000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CV2688ST' ORDER BY bc_level
