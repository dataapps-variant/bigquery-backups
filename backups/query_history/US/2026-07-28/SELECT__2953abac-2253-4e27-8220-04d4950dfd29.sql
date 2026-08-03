-- job_id: 2953abac-2253-4e27-8220-04d4950dfd29
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:30:01.748000+00:00
-- started: 2026-07-28T14:30:01.829000+00:00
-- ended: 2026-07-28T14:30:01.948000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD1000AE' ORDER BY bc_level
