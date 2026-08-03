-- job_id: d922ad9b-dc8b-4c8a-9513-b8fc6a2c2324
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:16.705000+00:00
-- started: 2026-07-28T10:05:16.744000+00:00
-- ended: 2026-07-28T10:05:16.941000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'JF5985ST' ORDER BY bc_level
