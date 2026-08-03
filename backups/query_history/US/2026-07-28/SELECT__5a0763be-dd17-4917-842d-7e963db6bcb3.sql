-- job_id: 5a0763be-dd17-4917-842d-7e963db6bcb3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:40.889000+00:00
-- started: 2026-07-28T14:31:41.197000+00:00
-- ended: 2026-07-28T14:31:41.304000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CL2788ST' ORDER BY bc_level
