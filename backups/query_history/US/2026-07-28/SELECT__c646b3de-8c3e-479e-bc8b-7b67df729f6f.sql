-- job_id: c646b3de-8c3e-479e-bc8b-7b67df729f6f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:03.321000+00:00
-- started: 2026-07-28T10:05:03.396000+00:00
-- ended: 2026-07-28T10:05:03.532000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'IQ2788YT' ORDER BY bc_level
