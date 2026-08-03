-- job_id: 3675077e-ab32-4be9-8359-dcc52c51aa42
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:30.898000+00:00
-- started: 2026-07-28T10:06:30.981000+00:00
-- ended: 2026-07-28T10:06:31.096000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'MB3983YT' ORDER BY bc_level
