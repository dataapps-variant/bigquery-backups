-- job_id: 6f4aa144-1dbb-49ec-9e96-158d8ded1ca6
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:22:18.764000+00:00
-- started: 2026-08-03T12:22:18.863000+00:00
-- ended: 2026-08-03T12:22:19.064000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD1000AE' ORDER BY bc_level
