-- job_id: 332755d8-2fe9-475e-9382-d26fb3583461
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:48.232000+00:00
-- started: 2026-08-03T12:24:48.302000+00:00
-- ended: 2026-08-03T12:24:48.412000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
