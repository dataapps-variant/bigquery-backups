-- job_id: 4180634f-ffa2-4588-b5cf-cc33e874dff5
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:36:47.614000+00:00
-- started: 2026-07-28T13:36:47.696000+00:00
-- ended: 2026-07-28T13:36:47.861000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-3'
                ORDER BY Day_Index
