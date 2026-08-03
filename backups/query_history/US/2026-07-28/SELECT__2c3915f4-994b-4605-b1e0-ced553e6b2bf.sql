-- job_id: 2c3915f4-994b-4605-b1e0-ced553e6b2bf
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:59:47.245000+00:00
-- started: 2026-07-28T09:59:47.345000+00:00
-- ended: 2026-07-28T09:59:47.610000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD2595ST' ORDER BY bc_level
