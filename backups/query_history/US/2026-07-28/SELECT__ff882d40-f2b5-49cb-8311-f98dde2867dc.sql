-- job_id: ff882d40-f2b5-49cb-8311-f98dde2867dc
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:38:24.200000+00:00
-- started: 2026-07-28T13:38:24.381000+00:00
-- ended: 2026-07-28T13:38:24.575000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-18'
                ORDER BY Day_Index
