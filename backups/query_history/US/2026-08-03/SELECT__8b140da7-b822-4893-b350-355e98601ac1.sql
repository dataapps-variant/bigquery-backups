-- job_id: 8b140da7-b822-4893-b350-355e98601ac1
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:47.978000+00:00
-- started: 2026-08-03T12:27:48.042000+00:00
-- ended: 2026-08-03T12:27:48.230000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'JF4995ST' ORDER BY bc_level
