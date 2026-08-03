-- job_id: 3522d076-2c7a-41e9-afbc-eaf39674eec0
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:12.021000+00:00
-- started: 2026-07-28T10:04:12.076000+00:00
-- ended: 2026-07-28T10:04:12.180000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'EN2788YT' ORDER BY bc_level
