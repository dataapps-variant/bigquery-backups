-- job_id: a4260428-bc09-4583-acfd-a560c15984dc
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:36.799000+00:00
-- started: 2026-07-28T10:04:36.862000+00:00
-- ended: 2026-07-28T10:04:36.947000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
