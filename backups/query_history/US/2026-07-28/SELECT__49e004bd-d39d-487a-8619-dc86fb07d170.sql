-- job_id: 49e004bd-d39d-487a-8619-dc86fb07d170
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:30:21.932000+00:00
-- started: 2026-07-28T14:30:22.023000+00:00
-- ended: 2026-07-28T14:30:22.127000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'AT2788YT' ORDER BY bc_level
