-- job_id: c9ff04b2-c3b0-450c-8c52-2fddc919db28
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:40:17.282000+00:00
-- started: 2026-07-28T13:40:17.358000+00:00
-- ended: 2026-07-28T13:40:17.522000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-36'
                ORDER BY Day_Index
