-- job_id: c9718cea-e1fa-4725-94ee-b55d023a891d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:31.957000+00:00
-- started: 2026-07-28T10:03:32.049000+00:00
-- ended: 2026-07-28T10:03:32.191000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT1792YT-JP' ORDER BY bc_level
