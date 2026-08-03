-- job_id: fe8019b9-b4f2-4a6e-b218-0e5df76d33f4
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:26.275000+00:00
-- started: 2026-07-28T10:06:26.344000+00:00
-- ended: 2026-07-28T10:06:26.414000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'MB6373YT' ORDER BY bc_level
