-- job_id: 457ff147-daf4-4798-8985-2ee12615c499
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:39:21.565000+00:00
-- started: 2026-07-28T13:39:21.669000+00:00
-- ended: 2026-07-28T13:39:21.861000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-27'
                ORDER BY Day_Index
