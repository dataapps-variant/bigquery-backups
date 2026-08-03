-- job_id: 646c6ec1-647f-467a-97d7-4f7bf0404e23
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:33.561000+00:00
-- started: 2026-07-28T10:06:33.602000+00:00
-- ended: 2026-07-28T10:06:33.790000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'JF2995ST' ORDER BY bc_level
