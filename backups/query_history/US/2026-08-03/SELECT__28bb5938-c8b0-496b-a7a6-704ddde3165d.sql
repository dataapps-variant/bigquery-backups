-- job_id: 28bb5938-c8b0-496b-a7a6-704ddde3165d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:04.569000+00:00
-- started: 2026-08-03T12:23:04.634000+00:00
-- ended: 2026-08-03T12:23:04.726000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'AT2788YT' ORDER BY bc_level
