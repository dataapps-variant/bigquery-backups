-- job_id: fc34abe1-522d-4c5e-9995-90bb70a289ff
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:40:54.096000+00:00
-- started: 2026-07-28T13:40:54.262000+00:00
-- ended: 2026-07-28T13:40:54.461000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-42'
                ORDER BY Day_Index
