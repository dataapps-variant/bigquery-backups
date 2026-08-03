-- job_id: 550454d8-0722-4e1f-8105-73ffa043e304
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:31.976000+00:00
-- started: 2026-08-03T12:27:32.054000+00:00
-- ended: 2026-08-03T12:27:32.243000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'MB3983YT' ORDER BY bc_level
