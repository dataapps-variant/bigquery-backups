-- job_id: 1af5450b-a3cc-4b50-a62a-0b8901848ba6
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:18.237000+00:00
-- started: 2026-07-28T10:04:18.296000+00:00
-- ended: 2026-07-28T10:04:18.475000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT3588YT-Non-JP' ORDER BY bc_level
