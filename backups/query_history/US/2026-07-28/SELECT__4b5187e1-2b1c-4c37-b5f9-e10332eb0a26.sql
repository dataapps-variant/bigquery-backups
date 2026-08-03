-- job_id: 4b5187e1-2b1c-4c37-b5f9-e10332eb0a26
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:11.231000+00:00
-- started: 2026-07-28T10:02:11.330000+00:00
-- ended: 2026-07-28T10:02:11.531000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD4988MT' ORDER BY bc_level
