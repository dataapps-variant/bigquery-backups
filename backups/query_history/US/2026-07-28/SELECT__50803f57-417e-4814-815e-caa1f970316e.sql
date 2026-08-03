-- job_id: 50803f57-417e-4814-815e-caa1f970316e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:41.597000+00:00
-- started: 2026-07-28T10:03:41.648000+00:00
-- ended: 2026-07-28T10:03:41.750000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CL2788ST' ORDER BY bc_level
