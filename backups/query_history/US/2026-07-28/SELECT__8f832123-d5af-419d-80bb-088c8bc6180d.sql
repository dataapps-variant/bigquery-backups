-- job_id: 8f832123-d5af-419d-80bb-088c8bc6180d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:40.495000+00:00
-- started: 2026-07-28T14:32:40.578000+00:00
-- ended: 2026-07-28T14:32:40.709000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CV1988ST' ORDER BY bc_level
