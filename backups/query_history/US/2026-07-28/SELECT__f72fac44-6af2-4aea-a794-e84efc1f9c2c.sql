-- job_id: f72fac44-6af2-4aea-a794-e84efc1f9c2c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:29.963000+00:00
-- started: 2026-07-28T14:34:30.046000+00:00
-- ended: 2026-07-28T14:34:30.122000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT4780YT-Non-JP' ORDER BY bc_level
