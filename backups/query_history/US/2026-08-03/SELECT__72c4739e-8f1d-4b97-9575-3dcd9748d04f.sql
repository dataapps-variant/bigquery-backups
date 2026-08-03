-- job_id: 72c4739e-8f1d-4b97-9575-3dcd9748d04f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:08.372000+00:00
-- started: 2026-08-03T12:25:08.440000+00:00
-- ended: 2026-08-03T12:25:08.628000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CV2788ST' ORDER BY bc_level
