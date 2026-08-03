-- job_id: 61fdc18e-ef7b-43b5-8cc9-b98ba69075d5
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:38.765000+00:00
-- started: 2026-07-28T10:05:38.820000+00:00
-- ended: 2026-07-28T10:05:38.896000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT3784YT-JP' ORDER BY bc_level
