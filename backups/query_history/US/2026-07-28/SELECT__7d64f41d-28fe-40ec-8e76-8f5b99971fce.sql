-- job_id: 7d64f41d-28fe-40ec-8e76-8f5b99971fce
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:15.950000+00:00
-- started: 2026-07-28T10:05:16.003000+00:00
-- ended: 2026-07-28T10:05:16.113000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT2788YT-JP' ORDER BY bc_level
