-- job_id: 5fe23dd3-cf1d-4118-b6a1-62fb46f6c3aa
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:36:32.711000+00:00
-- started: 2026-07-28T13:36:32.814000+00:00
-- ended: 2026-07-28T13:36:33.019000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-1'
                ORDER BY Day_Index
