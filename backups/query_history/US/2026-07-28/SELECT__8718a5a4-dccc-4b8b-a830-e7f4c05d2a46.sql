-- job_id: 8718a5a4-dccc-4b8b-a830-e7f4c05d2a46
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:26.074000+00:00
-- started: 2026-07-28T14:34:26.136000+00:00
-- ended: 2026-07-28T14:34:26.271000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT2788MT-Non-JP' ORDER BY bc_level
