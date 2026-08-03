-- job_id: bf52f488-2327-48eb-a9a9-95bee1608cf9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:52.819000+00:00
-- started: 2026-07-28T10:02:52.871000+00:00
-- ended: 2026-07-28T10:02:53.138000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'IQ2788YT' ORDER BY bc_level
