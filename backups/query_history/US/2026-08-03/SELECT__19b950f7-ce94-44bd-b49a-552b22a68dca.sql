-- job_id: 19b950f7-ce94-44bd-b49a-552b22a68dca
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:08.144000+00:00
-- started: 2026-08-03T12:24:08.222000+00:00
-- ended: 2026-08-03T12:24:08.317000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CL2788ST' ORDER BY bc_level
