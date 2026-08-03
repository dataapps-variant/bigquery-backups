-- job_id: 2dc91b9d-27f4-4e5e-afe5-0dda56cd3bce
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:55.809000+00:00
-- started: 2026-07-28T10:04:55.885000+00:00
-- ended: 2026-07-28T10:04:55.970000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CV1988ST' ORDER BY bc_level
