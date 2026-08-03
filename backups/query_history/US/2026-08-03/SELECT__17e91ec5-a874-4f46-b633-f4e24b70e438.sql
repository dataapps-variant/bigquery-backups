-- job_id: 17e91ec5-a874-4f46-b633-f4e24b70e438
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:04.399000+00:00
-- started: 2026-08-03T12:27:04.484000+00:00
-- ended: 2026-08-03T12:27:04.741000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT2788MT-Non-JP' ORDER BY bc_level
