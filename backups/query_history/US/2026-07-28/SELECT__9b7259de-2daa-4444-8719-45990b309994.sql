-- job_id: 9b7259de-2daa-4444-8719-45990b309994
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:50.481000+00:00
-- started: 2026-07-28T10:04:50.518000+00:00
-- ended: 2026-07-28T10:04:50.686000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'MB3983YT' ORDER BY bc_level
