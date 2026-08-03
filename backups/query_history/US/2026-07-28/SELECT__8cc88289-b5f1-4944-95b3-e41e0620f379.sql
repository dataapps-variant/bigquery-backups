-- job_id: 8cc88289-b5f1-4944-95b3-e41e0620f379
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:09.151000+00:00
-- started: 2026-07-28T14:33:09.247000+00:00
-- ended: 2026-07-28T14:33:09.329000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'RL2788ST' ORDER BY bc_level
