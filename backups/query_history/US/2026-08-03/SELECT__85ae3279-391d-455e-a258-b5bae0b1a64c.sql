-- job_id: 85ae3279-391d-455e-a258-b5bae0b1a64c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:13.650000+00:00
-- started: 2026-08-03T12:24:13.736000+00:00
-- ended: 2026-08-03T12:24:14.129000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'EN2788YT' ORDER BY bc_level
