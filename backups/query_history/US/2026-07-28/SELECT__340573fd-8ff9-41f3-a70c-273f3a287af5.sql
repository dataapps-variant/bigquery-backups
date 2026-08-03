-- job_id: 340573fd-8ff9-41f3-a70c-273f3a287af5
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:13.945000+00:00
-- started: 2026-07-28T10:04:14.005000+00:00
-- ended: 2026-07-28T10:04:14.198000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT1792YT-Non-JP' ORDER BY bc_level
