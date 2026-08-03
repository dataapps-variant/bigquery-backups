-- job_id: ae449280-60b9-42ca-ad11-b24b9d7c7d34
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:59:56.599000+00:00
-- started: 2026-07-28T09:59:56.687000+00:00
-- ended: 2026-07-28T09:59:56.828000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD1000AE' ORDER BY bc_level
