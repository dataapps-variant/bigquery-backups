-- job_id: d59b63bf-80fc-4fc0-b4c8-714588ad59ff
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:14.559000+00:00
-- started: 2026-08-03T12:26:14.623000+00:00
-- ended: 2026-08-03T12:26:14.797000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT4780YT-JP' ORDER BY bc_level
