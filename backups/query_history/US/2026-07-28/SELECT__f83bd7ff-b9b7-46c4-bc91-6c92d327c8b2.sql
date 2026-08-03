-- job_id: f83bd7ff-b9b7-46c4-bc91-6c92d327c8b2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:42:29.290000+00:00
-- started: 2026-07-28T13:42:29.372000+00:00
-- ended: 2026-07-28T13:42:29.539000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-57'
                ORDER BY Day_Index
