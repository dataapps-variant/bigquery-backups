-- job_id: d02032c4-ae90-42c9-9d82-e7a64e437ec7
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:55.990000+00:00
-- started: 2026-08-03T12:26:56.100000+00:00
-- ended: 2026-08-03T12:26:56.265000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT3588YT-Non-JP' ORDER BY bc_level
