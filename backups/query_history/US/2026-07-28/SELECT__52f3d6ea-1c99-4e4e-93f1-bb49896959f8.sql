-- job_id: 52f3d6ea-1c99-4e4e-93f1-bb49896959f8
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:59.897000+00:00
-- started: 2026-07-28T14:32:59.966000+00:00
-- ended: 2026-07-28T14:33:00.091000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'RT2788ST' ORDER BY bc_level
