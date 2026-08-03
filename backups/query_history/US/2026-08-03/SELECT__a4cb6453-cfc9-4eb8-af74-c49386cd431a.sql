-- job_id: a4cb6453-cfc9-4eb8-af74-c49386cd431a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:21:56.126000+00:00
-- started: 2026-08-03T12:21:56.230000+00:00
-- ended: 2026-08-03T12:21:56.439000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD4988PTGT' ORDER BY bc_level
