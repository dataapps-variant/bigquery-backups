-- job_id: 5e38226d-8a7f-4035-a53e-c4fdf4984f99
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:45.554000+00:00
-- started: 2026-07-28T14:34:45.843000+00:00
-- ended: 2026-07-28T14:34:45.972000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'MB5178YT' ORDER BY bc_level
