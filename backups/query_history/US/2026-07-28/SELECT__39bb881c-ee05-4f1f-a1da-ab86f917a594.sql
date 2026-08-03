-- job_id: 39bb881c-ee05-4f1f-a1da-ab86f917a594
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:38.926000+00:00
-- started: 2026-07-28T10:04:38.990000+00:00
-- ended: 2026-07-28T10:04:39.135000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'MB2788YT' ORDER BY bc_level
