-- job_id: f25516e8-7314-40c1-990c-204d34d864f2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:37.505000+00:00
-- started: 2026-08-03T12:23:37.595000+00:00
-- ended: 2026-08-03T12:23:37.753000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CL2788ST' ORDER BY bc_level
