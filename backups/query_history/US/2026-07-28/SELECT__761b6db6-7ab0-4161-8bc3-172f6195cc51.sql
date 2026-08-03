-- job_id: 761b6db6-7ab0-4161-8bc3-172f6195cc51
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:38:12.249000+00:00
-- started: 2026-07-28T13:38:12.396000+00:00
-- ended: 2026-07-28T13:38:12.546000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-16'
                ORDER BY Day_Index
