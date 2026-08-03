-- job_id: 6f16938a-dc27-49d1-9da7-3c907ed4e670
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:59:31.883000+00:00
-- started: 2026-07-28T09:59:32.008000+00:00
-- ended: 2026-07-28T09:59:32.177000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD4988MT' ORDER BY bc_level
