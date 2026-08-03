-- job_id: 6d491059-515e-4691-a616-e51655359067
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:59.066000+00:00
-- started: 2026-08-03T12:23:59.153000+00:00
-- ended: 2026-08-03T12:23:59.368000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CL8970ST' ORDER BY bc_level
