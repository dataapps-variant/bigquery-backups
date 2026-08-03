-- job_id: 6247ee48-edab-4edf-a2b0-1fdee776473f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:47.387000+00:00
-- started: 2026-08-03T12:25:47.430000+00:00
-- ended: 2026-08-03T12:25:47.668000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT2788YT-JP' ORDER BY bc_level
