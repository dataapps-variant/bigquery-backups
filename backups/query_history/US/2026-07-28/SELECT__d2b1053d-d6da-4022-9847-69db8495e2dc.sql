-- job_id: d2b1053d-d6da-4022-9847-69db8495e2dc
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:42:41.200000+00:00
-- started: 2026-07-28T13:42:41.308000+00:00
-- ended: 2026-07-28T13:42:41.491000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-59'
                ORDER BY Day_Index
