-- job_id: 98012ad6-a056-4832-8f82-8126acd8dc87
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:54.259000+00:00
-- started: 2026-07-28T10:04:54.313000+00:00
-- ended: 2026-07-28T10:04:54.445000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'JF2995ST' ORDER BY bc_level
