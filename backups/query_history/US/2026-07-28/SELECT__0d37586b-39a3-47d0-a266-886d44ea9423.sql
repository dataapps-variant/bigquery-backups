-- job_id: 0d37586b-39a3-47d0-a266-886d44ea9423
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:25.723000+00:00
-- started: 2026-07-28T10:02:25.811000+00:00
-- ended: 2026-07-28T10:02:26.129000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD2595ST' ORDER BY bc_level
