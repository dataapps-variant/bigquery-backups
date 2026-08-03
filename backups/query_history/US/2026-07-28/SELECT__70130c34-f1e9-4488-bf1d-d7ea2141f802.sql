-- job_id: 70130c34-f1e9-4488-bf1d-d7ea2141f802
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:56.277000+00:00
-- started: 2026-07-28T14:31:56.342000+00:00
-- ended: 2026-07-28T14:31:56.449000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
