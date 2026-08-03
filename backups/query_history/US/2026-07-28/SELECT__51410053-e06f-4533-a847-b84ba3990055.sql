-- job_id: 51410053-e06f-4533-a847-b84ba3990055
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:40.853000+00:00
-- started: 2026-07-28T10:04:40.916000+00:00
-- ended: 2026-07-28T10:04:40.998000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
