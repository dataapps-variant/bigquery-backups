-- job_id: d33177ab-83f9-435e-9dee-e23cf88bfee8
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:00.024000+00:00
-- started: 2026-08-03T12:26:00.154000+00:00
-- ended: 2026-08-03T12:26:00.368000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT3983YT-JP' ORDER BY bc_level
