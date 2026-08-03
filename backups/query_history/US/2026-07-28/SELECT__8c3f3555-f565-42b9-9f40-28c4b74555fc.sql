-- job_id: 8c3f3555-f565-42b9-9f40-28c4b74555fc
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:48.572000+00:00
-- started: 2026-07-28T10:03:48.673000+00:00
-- ended: 2026-07-28T10:03:48.870000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT2788YT-Non-JP' ORDER BY bc_level
