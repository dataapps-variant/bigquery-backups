-- job_id: 186f1120-6a9b-4371-803e-96b16943615f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:37.130000+00:00
-- started: 2026-07-28T10:06:37.193000+00:00
-- ended: 2026-07-28T10:06:37.292000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'JF8970ST' ORDER BY bc_level
