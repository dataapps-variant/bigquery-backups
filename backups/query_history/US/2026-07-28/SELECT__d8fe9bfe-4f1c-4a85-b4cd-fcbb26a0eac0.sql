-- job_id: d8fe9bfe-4f1c-4a85-b4cd-fcbb26a0eac0
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:23.598000+00:00
-- started: 2026-07-28T10:06:23.647000+00:00
-- ended: 2026-07-28T10:06:23.744000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'MB2788YT' ORDER BY bc_level
