-- job_id: 4fddf2a3-5480-49f9-b4db-5ceef23cb115
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:13.541000+00:00
-- started: 2026-07-28T10:03:13.753000+00:00
-- ended: 2026-07-28T10:03:13.858000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'AT2788YT' ORDER BY bc_level
