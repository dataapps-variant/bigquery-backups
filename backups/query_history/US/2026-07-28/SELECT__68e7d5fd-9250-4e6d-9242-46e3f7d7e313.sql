-- job_id: 68e7d5fd-9250-4e6d-9242-46e3f7d7e313
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:37.920000+00:00
-- started: 2026-07-28T10:01:38.021000+00:00
-- ended: 2026-07-28T10:01:38.319000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CL2788ST' ORDER BY bc_level
