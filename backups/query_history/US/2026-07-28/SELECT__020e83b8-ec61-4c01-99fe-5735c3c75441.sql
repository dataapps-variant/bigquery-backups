-- job_id: 020e83b8-ec61-4c01-99fe-5735c3c75441
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:41.311000+00:00
-- started: 2026-07-28T14:34:41.354000+00:00
-- ended: 2026-07-28T14:34:41.466000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'MB6373YT' ORDER BY bc_level
