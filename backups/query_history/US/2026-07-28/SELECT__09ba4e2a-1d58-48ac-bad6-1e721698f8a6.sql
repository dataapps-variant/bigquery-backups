-- job_id: 09ba4e2a-1d58-48ac-bad6-1e721698f8a6
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:28.493000+00:00
-- started: 2026-07-28T14:31:28.571000+00:00
-- ended: 2026-07-28T14:31:28.661000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CL1194ST' ORDER BY bc_level
