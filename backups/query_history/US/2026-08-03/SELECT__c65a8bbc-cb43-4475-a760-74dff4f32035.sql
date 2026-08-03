-- job_id: c65a8bbc-cb43-4475-a760-74dff4f32035
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:43.161000+00:00
-- started: 2026-08-03T12:25:43.223000+00:00
-- ended: 2026-08-03T12:25:43.418000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'RL2788ST' ORDER BY bc_level
