-- job_id: fb2b53ba-979b-4f8b-91ea-8a159e56e570
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:30:41.820000+00:00
-- started: 2026-07-28T14:30:41.932000+00:00
-- ended: 2026-07-28T14:30:42.029000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'AT2788YT' ORDER BY bc_level
