-- job_id: d5dbb4d1-7d41-4183-8413-4257bc98d5bd
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:42.585000+00:00
-- started: 2026-07-28T10:04:42.643000+00:00
-- ended: 2026-07-28T10:04:42.807000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'MB6373YT' ORDER BY bc_level
