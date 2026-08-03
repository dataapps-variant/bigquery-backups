-- job_id: d7bb39fb-0dcf-44e1-a672-e073bc9ef72f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:19.010000+00:00
-- started: 2026-07-28T10:01:19.086000+00:00
-- ended: 2026-07-28T10:01:19.259000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CL2995ST' ORDER BY bc_level
