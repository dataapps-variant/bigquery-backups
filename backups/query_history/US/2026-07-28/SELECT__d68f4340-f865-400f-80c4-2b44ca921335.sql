-- job_id: d68f4340-f865-400f-80c4-2b44ca921335
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:58.073000+00:00
-- started: 2026-07-28T14:34:58.144000+00:00
-- ended: 2026-07-28T14:34:58.250000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'JF8970ST' ORDER BY bc_level
