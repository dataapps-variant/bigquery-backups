-- job_id: 9ce139c5-232f-4e1a-82a2-f70e4b8db45f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:59:52.612000+00:00
-- started: 2026-07-28T09:59:52.712000+00:00
-- ended: 2026-07-28T09:59:52.907000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD1000AE' ORDER BY bc_level
