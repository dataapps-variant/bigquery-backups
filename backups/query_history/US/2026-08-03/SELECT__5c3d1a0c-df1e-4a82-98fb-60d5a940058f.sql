-- job_id: 5c3d1a0c-df1e-4a82-98fb-60d5a940058f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:58.641000+00:00
-- started: 2026-08-03T12:24:58.730000+00:00
-- ended: 2026-08-03T12:24:58.821000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
