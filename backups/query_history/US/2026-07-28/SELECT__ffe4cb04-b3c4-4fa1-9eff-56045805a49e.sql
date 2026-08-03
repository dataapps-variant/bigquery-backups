-- job_id: ffe4cb04-b3c4-4fa1-9eff-56045805a49e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:22.301000+00:00
-- started: 2026-07-28T14:34:22.368000+00:00
-- ended: 2026-07-28T14:34:22.481000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT4588YT-Non-JP' ORDER BY bc_level
