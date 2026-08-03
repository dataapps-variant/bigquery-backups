-- job_id: 9c84d322-7ace-4f48-94fa-fea30052ad69
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:42:09.533000+00:00
-- started: 2026-07-28T13:42:09.623000+00:00
-- ended: 2026-07-28T13:42:09.808000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-54'
                ORDER BY Day_Index
