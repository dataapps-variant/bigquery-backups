-- job_id: ecb38420-5cbb-4901-82c9-e0b947cffd4d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:40.009000+00:00
-- started: 2026-07-28T10:03:40.061000+00:00
-- ended: 2026-07-28T10:03:40.219000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT3784YT-JP' ORDER BY bc_level
