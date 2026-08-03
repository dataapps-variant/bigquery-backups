-- job_id: 4f746f0d-f358-4447-8508-bcbdeb1a0e56
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:52.509000+00:00
-- started: 2026-07-28T10:03:52.569000+00:00
-- ended: 2026-07-28T10:03:52.748000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CL2995ST' ORDER BY bc_level
