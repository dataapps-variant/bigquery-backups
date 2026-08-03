-- job_id: 928d696c-8f5c-43c7-8856-adea7c289203
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:02.875000+00:00
-- started: 2026-07-28T10:01:02.995000+00:00
-- ended: 2026-07-28T10:01:03.180000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CN3999ST' ORDER BY bc_level
