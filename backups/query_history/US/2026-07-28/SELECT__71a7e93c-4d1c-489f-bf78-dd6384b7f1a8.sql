-- job_id: 71a7e93c-4d1c-489f-bf78-dd6384b7f1a8
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:13.429000+00:00
-- started: 2026-07-28T10:06:13.516000+00:00
-- ended: 2026-07-28T10:06:13.615000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT4588YT-Non-JP' ORDER BY bc_level
