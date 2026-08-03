-- job_id: c0ae9ab7-290d-4e07-a1cf-4d7874cbe8ae
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:56.868000+00:00
-- started: 2026-07-28T10:03:56.939000+00:00
-- ended: 2026-07-28T10:03:57.100000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CL1194ST' ORDER BY bc_level
