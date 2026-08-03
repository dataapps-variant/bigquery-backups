-- job_id: d2cdda1d-873f-4e9b-a748-61676abc32c0
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:00:18.396000+00:00
-- started: 2026-07-28T10:00:18.488000+00:00
-- ended: 2026-07-28T10:00:18.781000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'AT2788YT' ORDER BY bc_level
