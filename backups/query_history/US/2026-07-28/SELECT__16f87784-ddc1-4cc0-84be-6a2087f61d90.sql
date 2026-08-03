-- job_id: 16f87784-ddc1-4cc0-84be-6a2087f61d90
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:40:25.030000+00:00
-- started: 2026-07-28T13:40:25.125000+00:00
-- ended: 2026-07-28T13:40:25.479000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-37'
                ORDER BY Day_Index
