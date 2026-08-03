-- job_id: 3db7b19d-5ab6-4b83-a64c-ddae8fca3b8f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:46.222000+00:00
-- started: 2026-07-28T14:33:46.314000+00:00
-- ended: 2026-07-28T14:33:46.395000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT6373YT-JP' ORDER BY bc_level
