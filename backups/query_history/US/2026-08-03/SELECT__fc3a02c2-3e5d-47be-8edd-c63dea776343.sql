-- job_id: fc3a02c2-3e5d-47be-8edd-c63dea776343
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:37.915000+00:00
-- started: 2026-08-03T12:25:37.990000+00:00
-- ended: 2026-08-03T12:25:38.189000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'RT2995ST' ORDER BY bc_level
