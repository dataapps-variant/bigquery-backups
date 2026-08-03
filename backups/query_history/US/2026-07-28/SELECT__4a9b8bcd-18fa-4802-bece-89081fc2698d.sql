-- job_id: 4a9b8bcd-18fa-4802-bece-89081fc2698d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:39:03.860000+00:00
-- started: 2026-07-28T13:39:03.946000+00:00
-- ended: 2026-07-28T13:39:04.138000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-24'
                ORDER BY Day_Index
