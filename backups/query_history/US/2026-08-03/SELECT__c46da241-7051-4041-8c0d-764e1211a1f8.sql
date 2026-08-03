-- job_id: c46da241-7051-4041-8c0d-764e1211a1f8
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:48.665000+00:00
-- started: 2026-08-03T12:23:48.787000+00:00
-- ended: 2026-08-03T12:23:48.993000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CL2995ST' ORDER BY bc_level
