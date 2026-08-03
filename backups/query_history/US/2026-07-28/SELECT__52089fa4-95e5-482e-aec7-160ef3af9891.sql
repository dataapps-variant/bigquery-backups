-- job_id: 52089fa4-95e5-482e-aec7-160ef3af9891
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:49.981000+00:00
-- started: 2026-07-28T14:33:50.034000+00:00
-- ended: 2026-07-28T14:33:50.113000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT2788YT-Non-JP' ORDER BY bc_level
