-- job_id: 50cd0869-1b3b-496d-b646-aa714ed23bb3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:53.060000+00:00
-- started: 2026-08-03T12:24:53.121000+00:00
-- ended: 2026-08-03T12:24:53.212000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
