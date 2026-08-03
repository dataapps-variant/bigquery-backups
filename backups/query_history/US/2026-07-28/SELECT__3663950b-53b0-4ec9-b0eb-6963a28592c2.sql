-- job_id: 3663950b-53b0-4ec9-b0eb-6963a28592c2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:00:45.454000+00:00
-- started: 2026-07-28T10:00:45.535000+00:00
-- ended: 2026-07-28T10:00:45.667000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'AT2788YT' ORDER BY bc_level
