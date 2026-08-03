-- job_id: 44cc8208-ec0a-4427-acad-147e0e962398
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:23.912000+00:00
-- started: 2026-07-28T10:03:23.980000+00:00
-- ended: 2026-07-28T10:03:24.157000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'AT3995YT' ORDER BY bc_level
