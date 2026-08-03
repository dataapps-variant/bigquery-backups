-- job_id: d7fbe8a9-4c3c-43e0-ad49-63fe1ed7a37c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:19.876000+00:00
-- started: 2026-07-28T10:03:19.952000+00:00
-- ended: 2026-07-28T10:03:20.057000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'AT2788YT' ORDER BY bc_level
