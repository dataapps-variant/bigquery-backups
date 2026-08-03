-- job_id: febd6a69-debe-4a9c-bee3-6be19182659e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:10.157000+00:00
-- started: 2026-07-28T10:02:10.290000+00:00
-- ended: 2026-07-28T10:02:10.391000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
