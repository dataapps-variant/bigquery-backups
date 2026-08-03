-- job_id: 42e32f5e-7203-4881-9ebe-90adea9c7b7d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:50.539000+00:00
-- started: 2026-07-28T10:02:50.609000+00:00
-- ended: 2026-07-28T10:02:50.765000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD2000AD' ORDER BY bc_level
