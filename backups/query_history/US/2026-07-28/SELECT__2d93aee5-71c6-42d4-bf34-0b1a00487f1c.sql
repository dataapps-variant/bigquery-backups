-- job_id: 2d93aee5-71c6-42d4-bf34-0b1a00487f1c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:41:38.894000+00:00
-- started: 2026-07-28T13:41:38.965000+00:00
-- ended: 2026-07-28T13:41:39.148000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-49'
                ORDER BY Day_Index
