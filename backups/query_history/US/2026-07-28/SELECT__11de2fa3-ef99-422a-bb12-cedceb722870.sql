-- job_id: 11de2fa3-ef99-422a-bb12-cedceb722870
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:45.211000+00:00
-- started: 2026-07-28T14:31:45.289000+00:00
-- ended: 2026-07-28T14:31:45.370000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'EN2788YT' ORDER BY bc_level
