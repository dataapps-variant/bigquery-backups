-- job_id: 32f7a917-9798-4d9b-8dc0-fde9eb19555f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:01.767000+00:00
-- started: 2026-08-03T12:28:01.814000+00:00
-- ended: 2026-08-03T12:28:02.003000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'JF5985ST' ORDER BY bc_level
