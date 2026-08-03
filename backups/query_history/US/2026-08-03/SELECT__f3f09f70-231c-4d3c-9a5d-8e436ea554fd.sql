-- job_id: f3f09f70-231c-4d3c-9a5d-8e436ea554fd
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:17.040000+00:00
-- started: 2026-08-03T12:23:17.124000+00:00
-- ended: 2026-08-03T12:23:17.357000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'AT3995YT' ORDER BY bc_level
