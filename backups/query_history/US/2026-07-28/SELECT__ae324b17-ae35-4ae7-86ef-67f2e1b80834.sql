-- job_id: ae324b17-ae35-4ae7-86ef-67f2e1b80834
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:10.710000+00:00
-- started: 2026-07-28T10:06:10.788000+00:00
-- ended: 2026-07-28T10:06:10.865000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT3588YT-Non-JP' ORDER BY bc_level
