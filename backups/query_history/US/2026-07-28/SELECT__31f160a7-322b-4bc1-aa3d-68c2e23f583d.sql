-- job_id: 31f160a7-322b-4bc1-aa3d-68c2e23f583d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:37:54.375000+00:00
-- started: 2026-07-28T13:37:54.498000+00:00
-- ended: 2026-07-28T13:37:54.663000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-13'
                ORDER BY Day_Index
