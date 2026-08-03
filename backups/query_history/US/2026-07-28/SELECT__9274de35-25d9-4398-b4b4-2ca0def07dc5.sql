-- job_id: 9274de35-25d9-4398-b4b4-2ca0def07dc5
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:40:42.438000+00:00
-- started: 2026-07-28T13:40:42.511000+00:00
-- ended: 2026-07-28T13:40:42.710000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-40'
                ORDER BY Day_Index
