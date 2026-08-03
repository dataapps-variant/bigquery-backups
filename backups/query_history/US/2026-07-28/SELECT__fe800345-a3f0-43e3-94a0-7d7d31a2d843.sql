-- job_id: fe800345-a3f0-43e3-94a0-7d7d31a2d843
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:11.491000+00:00
-- started: 2026-07-28T14:31:11.550000+00:00
-- ended: 2026-07-28T14:31:11.665000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CL2788ST' ORDER BY bc_level
