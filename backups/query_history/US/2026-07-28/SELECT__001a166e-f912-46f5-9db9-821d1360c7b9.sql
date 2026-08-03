-- job_id: 001a166e-f912-46f5-9db9-821d1360c7b9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:38:06.112000+00:00
-- started: 2026-07-28T13:38:06.198000+00:00
-- ended: 2026-07-28T13:38:06.408000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-15'
                ORDER BY Day_Index
