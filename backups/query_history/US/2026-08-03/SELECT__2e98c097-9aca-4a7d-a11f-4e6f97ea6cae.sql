-- job_id: 2e98c097-9aca-4a7d-a11f-4e6f97ea6cae
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:27.717000+00:00
-- started: 2026-08-03T12:27:27.785000+00:00
-- ended: 2026-08-03T12:27:27.950000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'MB5178YT' ORDER BY bc_level
