-- job_id: 2ff4b0cb-ed39-417b-8357-6a5cd1f664e1
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:12.207000+00:00
-- started: 2026-08-03T12:23:12.361000+00:00
-- ended: 2026-08-03T12:23:12.436000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'AT2788YT' ORDER BY bc_level
