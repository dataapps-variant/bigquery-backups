-- job_id: 25a888fe-ef9d-4ad1-a837-10eca84986d9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:41:32.783000+00:00
-- started: 2026-07-28T13:41:32.834000+00:00
-- ended: 2026-07-28T13:41:33.075000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-48'
                ORDER BY Day_Index
