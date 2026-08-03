-- job_id: 13f75588-c817-43e9-87c5-24123087710c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:36.139000+00:00
-- started: 2026-07-28T14:32:36.234000+00:00
-- ended: 2026-07-28T14:32:36.368000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CV2788ST' ORDER BY bc_level
