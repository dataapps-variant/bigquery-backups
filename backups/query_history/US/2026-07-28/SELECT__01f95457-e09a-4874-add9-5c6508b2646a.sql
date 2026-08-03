-- job_id: 01f95457-e09a-4874-add9-5c6508b2646a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:38:36.408000+00:00
-- started: 2026-07-28T13:38:36.527000+00:00
-- ended: 2026-07-28T13:38:36.729000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-20'
                ORDER BY Day_Index
