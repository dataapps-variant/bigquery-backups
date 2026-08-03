-- job_id: be2bade8-37d9-45f8-b474-10f04cc1ae43
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:32.622000+00:00
-- started: 2026-07-28T14:31:32.691000+00:00
-- ended: 2026-07-28T14:31:32.801000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CL8970ST' ORDER BY bc_level
