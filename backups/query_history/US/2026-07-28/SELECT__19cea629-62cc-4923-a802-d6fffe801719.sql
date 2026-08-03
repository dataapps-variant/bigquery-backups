-- job_id: 19cea629-62cc-4923-a802-d6fffe801719
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:08.296000+00:00
-- started: 2026-07-28T10:06:08.404000+00:00
-- ended: 2026-07-28T10:06:08.507000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT1792YT-Non-JP' ORDER BY bc_level
