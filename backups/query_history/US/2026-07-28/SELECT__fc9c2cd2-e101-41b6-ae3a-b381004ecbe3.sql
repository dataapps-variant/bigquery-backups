-- job_id: fc9c2cd2-e101-41b6-ae3a-b381004ecbe3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:39:27.435000+00:00
-- started: 2026-07-28T13:39:27.627000+00:00
-- ended: 2026-07-28T13:39:27.798000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-28'
                ORDER BY Day_Index
