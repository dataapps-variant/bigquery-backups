-- job_id: a8ef9ab7-403e-4e7a-9743-02583853239c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:59.671000+00:00
-- started: 2026-08-03T12:26:59.732000+00:00
-- ended: 2026-08-03T12:26:59.913000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT4588YT-Non-JP' ORDER BY bc_level
