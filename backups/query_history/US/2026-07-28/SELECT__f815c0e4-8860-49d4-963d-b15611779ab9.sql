-- job_id: f815c0e4-8860-49d4-963d-b15611779ab9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:22.706000+00:00
-- started: 2026-07-28T10:04:22.774000+00:00
-- ended: 2026-07-28T10:04:22.977000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT4588YT-Non-JP' ORDER BY bc_level
