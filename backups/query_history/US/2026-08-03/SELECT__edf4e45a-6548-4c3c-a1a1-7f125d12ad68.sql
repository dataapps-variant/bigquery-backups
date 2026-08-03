-- job_id: edf4e45a-6548-4c3c-a1a1-7f125d12ad68
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:33.176000+00:00
-- started: 2026-08-03T12:25:33.241000+00:00
-- ended: 2026-08-03T12:25:33.449000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'RT2788ST' ORDER BY bc_level
