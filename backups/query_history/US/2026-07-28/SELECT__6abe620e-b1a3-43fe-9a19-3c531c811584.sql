-- job_id: 6abe620e-b1a3-43fe-9a19-3c531c811584
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:29:50.381000+00:00
-- started: 2026-07-28T14:29:50.524000+00:00
-- ended: 2026-07-28T14:29:50.647000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD2595ST' ORDER BY bc_level
