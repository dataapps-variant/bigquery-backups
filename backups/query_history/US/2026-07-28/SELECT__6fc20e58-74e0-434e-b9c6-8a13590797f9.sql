-- job_id: 6fc20e58-74e0-434e-b9c6-8a13590797f9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:00:06.890000+00:00
-- started: 2026-07-28T10:00:06.987000+00:00
-- ended: 2026-07-28T10:00:07.143000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD1440AD' ORDER BY bc_level
