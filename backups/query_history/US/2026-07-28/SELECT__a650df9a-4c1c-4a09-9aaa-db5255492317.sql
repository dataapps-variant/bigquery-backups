-- job_id: a650df9a-4c1c-4a09-9aaa-db5255492317
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:07.157000+00:00
-- started: 2026-07-28T14:31:07.239000+00:00
-- ended: 2026-07-28T14:31:07.356000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CN3999ST' ORDER BY bc_level
