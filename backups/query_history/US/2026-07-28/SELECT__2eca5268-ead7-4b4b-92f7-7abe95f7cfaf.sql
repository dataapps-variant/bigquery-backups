-- job_id: 2eca5268-ead7-4b4b-92f7-7abe95f7cfaf
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:54.381000+00:00
-- started: 2026-07-28T10:02:54.437000+00:00
-- ended: 2026-07-28T10:02:54.855000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'AT2788YT' ORDER BY bc_level
