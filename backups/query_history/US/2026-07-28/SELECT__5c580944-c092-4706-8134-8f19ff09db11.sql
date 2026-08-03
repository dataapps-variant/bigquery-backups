-- job_id: 5c580944-c092-4706-8134-8f19ff09db11
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:42:15.104000+00:00
-- started: 2026-07-28T13:42:15.209000+00:00
-- ended: 2026-07-28T13:42:15.390000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-55'
                ORDER BY Day_Index
