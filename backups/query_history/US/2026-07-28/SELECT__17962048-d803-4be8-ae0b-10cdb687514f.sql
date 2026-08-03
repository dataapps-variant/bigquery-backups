-- job_id: 17962048-d803-4be8-ae0b-10cdb687514f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:42.462000+00:00
-- started: 2026-07-28T14:33:42.559000+00:00
-- ended: 2026-07-28T14:33:42.637000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT3784YT-JP' ORDER BY bc_level
