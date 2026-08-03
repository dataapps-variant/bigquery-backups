-- job_id: bed0274a-002d-4905-9d31-2de3c0a49a36
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:29:56.960000+00:00
-- started: 2026-07-28T14:29:57.064000+00:00
-- ended: 2026-07-28T14:29:57.165000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD1000AE' ORDER BY bc_level
