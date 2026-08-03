-- job_id: b2bbe7ed-19ad-4dbb-996c-ef9fe8183a9c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:43.995000+00:00
-- started: 2026-07-28T10:04:44.068000+00:00
-- ended: 2026-07-28T10:04:44.168000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
