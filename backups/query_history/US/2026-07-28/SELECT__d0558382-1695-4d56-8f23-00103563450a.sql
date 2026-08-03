-- job_id: d0558382-1695-4d56-8f23-00103563450a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:39:52.041000+00:00
-- started: 2026-07-28T13:39:52.113000+00:00
-- ended: 2026-07-28T13:39:52.273000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-32'
                ORDER BY Day_Index
