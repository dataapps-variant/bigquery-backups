-- job_id: d0a070a0-ac29-4e2a-bffb-05fa4fd3ccc1
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:43.024000+00:00
-- started: 2026-08-03T12:24:43.116000+00:00
-- ended: 2026-08-03T12:24:43.211000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
