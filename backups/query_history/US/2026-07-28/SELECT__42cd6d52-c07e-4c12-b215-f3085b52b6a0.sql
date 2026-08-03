-- job_id: 42cd6d52-c07e-4c12-b215-f3085b52b6a0
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:04.221000+00:00
-- started: 2026-07-28T10:04:04.308000+00:00
-- ended: 2026-07-28T10:04:04.391000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CL5985ST' ORDER BY bc_level
