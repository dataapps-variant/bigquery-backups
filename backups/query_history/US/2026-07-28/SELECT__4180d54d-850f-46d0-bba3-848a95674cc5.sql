-- job_id: 4180d54d-850f-46d0-bba3-848a95674cc5
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:41:27.155000+00:00
-- started: 2026-07-28T13:41:27.217000+00:00
-- ended: 2026-07-28T13:41:27.383000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-47'
                ORDER BY Day_Index
