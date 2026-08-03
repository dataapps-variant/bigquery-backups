-- job_id: b15380ef-5efc-43a2-9c20-8cd31a4533e9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:23.743000+00:00
-- started: 2026-07-28T10:01:23.823000+00:00
-- ended: 2026-07-28T10:01:23.986000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CL1194ST' ORDER BY bc_level
