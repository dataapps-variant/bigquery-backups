-- job_id: 1d2ff585-47df-440c-8c58-4bc04ed2e14f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:38:51.718000+00:00
-- started: 2026-07-28T13:38:51.828000+00:00
-- ended: 2026-07-28T13:38:52+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-22'
                ORDER BY Day_Index
