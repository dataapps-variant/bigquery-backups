-- job_id: 099478d0-60bc-45e4-93d5-2a823c455fa1
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:00:57.774000+00:00
-- started: 2026-07-28T10:00:58.098000+00:00
-- ended: 2026-07-28T10:00:58.286000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CN3400ST' ORDER BY bc_level
