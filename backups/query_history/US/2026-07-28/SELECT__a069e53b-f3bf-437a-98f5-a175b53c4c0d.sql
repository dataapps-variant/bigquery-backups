-- job_id: a069e53b-f3bf-437a-98f5-a175b53c4c0d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:40.056000+00:00
-- started: 2026-07-28T10:02:40.132000+00:00
-- ended: 2026-07-28T10:02:40.317000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD2995MT' ORDER BY bc_level
