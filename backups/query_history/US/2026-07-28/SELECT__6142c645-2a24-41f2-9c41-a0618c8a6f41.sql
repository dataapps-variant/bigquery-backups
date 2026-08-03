-- job_id: 6142c645-2a24-41f2-9c41-a0618c8a6f41
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:53.428000+00:00
-- started: 2026-07-28T14:34:53.518000+00:00
-- ended: 2026-07-28T14:34:53.624000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'JF2995ST' ORDER BY bc_level
