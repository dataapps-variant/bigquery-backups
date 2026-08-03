-- job_id: 57355f54-9d3f-4476-8d73-b21b2a63ad8a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:29.941000+00:00
-- started: 2026-07-28T10:02:30.018000+00:00
-- ended: 2026-07-28T10:02:30.124000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
