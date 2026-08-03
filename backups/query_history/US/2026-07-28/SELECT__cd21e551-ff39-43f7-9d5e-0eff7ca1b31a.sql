-- job_id: cd21e551-ff39-43f7-9d5e-0eff7ca1b31a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:00:38.613000+00:00
-- started: 2026-07-28T10:00:38.701000+00:00
-- ended: 2026-07-28T10:00:38.814000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'AT2788YT' ORDER BY bc_level
