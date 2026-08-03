-- job_id: b0a3fefe-d103-4c36-a71d-dac5ebc6af32
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:41:44.564000+00:00
-- started: 2026-07-28T13:41:44.660000+00:00
-- ended: 2026-07-28T13:41:44.861000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-50'
                ORDER BY Day_Index
