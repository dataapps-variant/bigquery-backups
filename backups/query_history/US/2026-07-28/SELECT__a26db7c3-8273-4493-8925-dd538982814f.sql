-- job_id: a26db7c3-8273-4493-8925-dd538982814f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:26.358000+00:00
-- started: 2026-07-28T14:33:26.429000+00:00
-- ended: 2026-07-28T14:33:26.529000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT3983YT-JP' ORDER BY bc_level
