-- job_id: 00de8c07-cadc-4ae5-b19d-18ef23e4ff5a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:40:10.706000+00:00
-- started: 2026-07-28T13:40:10.869000+00:00
-- ended: 2026-07-28T13:40:11.051000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-35'
                ORDER BY Day_Index
