-- job_id: 863afa6f-109d-4592-867c-453faaad8628
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:37:23.334000+00:00
-- started: 2026-07-28T13:37:23.413000+00:00
-- ended: 2026-07-28T13:37:23.576000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-8'
                ORDER BY Day_Index
