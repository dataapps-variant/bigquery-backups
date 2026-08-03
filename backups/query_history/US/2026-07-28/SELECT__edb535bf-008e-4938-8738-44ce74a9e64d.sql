-- job_id: edb535bf-008e-4938-8738-44ce74a9e64d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:22.743000+00:00
-- started: 2026-07-28T10:04:22.802000+00:00
-- ended: 2026-07-28T10:04:22.929000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
