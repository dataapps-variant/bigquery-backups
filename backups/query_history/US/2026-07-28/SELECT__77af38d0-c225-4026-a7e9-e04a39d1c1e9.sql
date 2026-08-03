-- job_id: 77af38d0-c225-4026-a7e9-e04a39d1c1e9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:30.665000+00:00
-- started: 2026-07-28T10:04:30.707000+00:00
-- ended: 2026-07-28T10:04:30.914000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT4780YT-Non-JP' ORDER BY bc_level
