-- job_id: bf7bc139-a4bf-432b-b68a-b04429eecb5b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:40:30.716000+00:00
-- started: 2026-07-28T13:40:30.789000+00:00
-- ended: 2026-07-28T13:40:30.975000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-38'
                ORDER BY Day_Index
