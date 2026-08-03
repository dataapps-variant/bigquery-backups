-- job_id: 55bb0090-9b65-49ea-b9aa-6d68856acd5a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:05.163000+00:00
-- started: 2026-08-03T12:26:05.286000+00:00
-- ended: 2026-08-03T12:26:05.444000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT5178YT-JP' ORDER BY bc_level
