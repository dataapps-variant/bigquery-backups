-- job_id: ea736e9f-aa63-493b-87f5-1701e2af7583
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:37.864000+00:00
-- started: 2026-08-03T12:24:37.936000+00:00
-- ended: 2026-08-03T12:24:38.050000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
