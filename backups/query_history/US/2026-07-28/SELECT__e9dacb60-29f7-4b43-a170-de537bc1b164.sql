-- job_id: e9dacb60-29f7-4b43-a170-de537bc1b164
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:15.851000+00:00
-- started: 2026-07-28T10:06:15.906000+00:00
-- ended: 2026-07-28T10:06:15.998000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT2788MT-Non-JP' ORDER BY bc_level
