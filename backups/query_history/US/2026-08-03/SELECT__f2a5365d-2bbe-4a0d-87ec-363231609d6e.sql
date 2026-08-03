-- job_id: f2a5365d-2bbe-4a0d-87ec-363231609d6e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:28.138000+00:00
-- started: 2026-08-03T12:25:28.217000+00:00
-- ended: 2026-08-03T12:25:28.379000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'IQ2788YT' ORDER BY bc_level
