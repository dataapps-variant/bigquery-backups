-- job_id: 9f420c12-4b55-42dc-ae90-2f1d2fb10b53
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:07.205000+00:00
-- started: 2026-07-28T10:03:07.287000+00:00
-- ended: 2026-07-28T10:03:07.438000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'RL2788ST' ORDER BY bc_level
