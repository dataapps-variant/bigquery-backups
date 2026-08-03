-- job_id: 73e7250c-cbfc-4f17-bb07-bd626e6262b2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:39.075000+00:00
-- started: 2026-07-28T10:02:39.182000+00:00
-- ended: 2026-07-28T10:02:39.405000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CV1988ST' ORDER BY bc_level
