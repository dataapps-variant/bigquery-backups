-- job_id: e21ff1d6-b7a3-4134-b86a-b778e6a75bc9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:41.316000+00:00
-- started: 2026-07-28T10:05:41.370000+00:00
-- ended: 2026-07-28T10:05:41.485000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT6373YT-JP' ORDER BY bc_level
