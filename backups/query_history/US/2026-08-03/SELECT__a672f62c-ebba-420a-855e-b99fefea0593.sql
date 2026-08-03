-- job_id: a672f62c-ebba-420a-855e-b99fefea0593
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:14.367000+00:00
-- started: 2026-08-03T12:27:14.424000+00:00
-- ended: 2026-08-03T12:27:14.620000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT3784YT-Non-JP' ORDER BY bc_level
