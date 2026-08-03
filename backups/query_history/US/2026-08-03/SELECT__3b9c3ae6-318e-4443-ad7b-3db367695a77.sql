-- job_id: 3b9c3ae6-318e-4443-ad7b-3db367695a77
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:13.465000+00:00
-- started: 2026-08-03T12:25:13.566000+00:00
-- ended: 2026-08-03T12:25:13.735000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CV1988ST' ORDER BY bc_level
