-- job_id: 692cecc8-ef89-43c1-82bd-6bcfb0e4b5a9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:51.790000+00:00
-- started: 2026-08-03T12:26:51.862000+00:00
-- ended: 2026-08-03T12:26:52.066000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT1792YT-Non-JP' ORDER BY bc_level
