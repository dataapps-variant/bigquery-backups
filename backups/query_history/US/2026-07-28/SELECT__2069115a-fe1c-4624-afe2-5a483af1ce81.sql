-- job_id: 2069115a-fe1c-4624-afe2-5a483af1ce81
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:34.357000+00:00
-- started: 2026-07-28T14:33:34.424000+00:00
-- ended: 2026-07-28T14:33:34.532000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT1792YT-JP' ORDER BY bc_level
