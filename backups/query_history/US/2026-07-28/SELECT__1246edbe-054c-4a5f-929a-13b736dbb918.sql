-- job_id: 1246edbe-054c-4a5f-929a-13b736dbb918
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:35:16.714000+00:00
-- started: 2026-07-28T14:35:16.781000+00:00
-- ended: 2026-07-28T14:35:16.872000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'JF5985ST' ORDER BY bc_level
