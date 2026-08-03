-- job_id: f1cd7999-9acd-44c1-a44f-fb9aacacbbe3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:00:49.813000+00:00
-- started: 2026-07-28T10:00:50.149000+00:00
-- ended: 2026-07-28T10:00:50.282000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'AT3995YT' ORDER BY bc_level
