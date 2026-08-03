-- job_id: f711be75-90ec-496c-9dbc-b06a78b44892
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:23.464000+00:00
-- started: 2026-08-03T12:25:23.594000+00:00
-- ended: 2026-08-03T12:25:23.689000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CV2788ST' ORDER BY bc_level
