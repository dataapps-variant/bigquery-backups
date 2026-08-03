-- job_id: ea8b390d-46c9-46f2-903a-963dcba28b27
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:09.618000+00:00
-- started: 2026-08-03T12:27:09.671000+00:00
-- ended: 2026-08-03T12:27:09.906000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT4780YT-Non-JP' ORDER BY bc_level
