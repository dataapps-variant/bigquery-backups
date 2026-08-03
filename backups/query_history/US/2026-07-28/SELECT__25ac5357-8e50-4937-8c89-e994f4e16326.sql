-- job_id: 25ac5357-8e50-4937-8c89-e994f4e16326
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:40:36.506000+00:00
-- started: 2026-07-28T13:40:36.565000+00:00
-- ended: 2026-07-28T13:40:36.753000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-39'
                ORDER BY Day_Index
