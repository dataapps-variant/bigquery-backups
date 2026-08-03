-- job_id: e46bbed0-03fc-4ff5-ac85-c779d34ecb78
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:26.628000+00:00
-- started: 2026-07-28T10:04:26.683000+00:00
-- ended: 2026-07-28T10:04:26.841000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT2788MT-Non-JP' ORDER BY bc_level
