-- job_id: 54839e65-2e5e-4455-b7ca-8bf5d88f88f2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:37.424000+00:00
-- started: 2026-07-28T14:34:37.543000+00:00
-- ended: 2026-07-28T14:34:37.639000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'MB2788YT' ORDER BY bc_level
