-- job_id: b31ea4fa-be44-4388-a112-f2b89367d58e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:35:20.795000+00:00
-- started: 2026-07-28T14:35:20.862000+00:00
-- ended: 2026-07-28T14:35:20.982000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'JF2788ST' ORDER BY bc_level
