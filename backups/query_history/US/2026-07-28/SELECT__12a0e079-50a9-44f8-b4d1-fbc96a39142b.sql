-- job_id: 12a0e079-50a9-44f8-b4d1-fbc96a39142b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:16.900000+00:00
-- started: 2026-07-28T14:32:16.994000+00:00
-- ended: 2026-07-28T14:32:17.100000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
