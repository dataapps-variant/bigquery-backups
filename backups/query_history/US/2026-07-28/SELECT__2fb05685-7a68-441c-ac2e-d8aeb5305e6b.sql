-- job_id: 2fb05685-7a68-441c-ac2e-d8aeb5305e6b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:02.821000+00:00
-- started: 2026-07-28T10:05:02.874000+00:00
-- ended: 2026-07-28T10:05:03.029000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'JF4995ST' ORDER BY bc_level
