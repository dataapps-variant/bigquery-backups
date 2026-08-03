-- job_id: 56357864-21cd-4fe3-ae5c-0e48093ee392
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:27.628000+00:00
-- started: 2026-08-03T12:26:27.699000+00:00
-- ended: 2026-08-03T12:26:27.859000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT2788YT-Non-JP' ORDER BY bc_level
