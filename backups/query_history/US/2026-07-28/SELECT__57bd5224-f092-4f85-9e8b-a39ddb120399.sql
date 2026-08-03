-- job_id: 57bd5224-f092-4f85-9e8b-a39ddb120399
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:07.810000+00:00
-- started: 2026-07-28T10:05:07.886000+00:00
-- ended: 2026-07-28T10:05:08.018000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'RT2788ST' ORDER BY bc_level
