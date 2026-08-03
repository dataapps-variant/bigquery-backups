-- job_id: d6f9d127-7d49-4fa1-84a2-10f30c92bd85
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:06.526000+00:00
-- started: 2026-08-03T12:28:06.621000+00:00
-- ended: 2026-08-03T12:28:06.832000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'JF2788ST' ORDER BY bc_level
