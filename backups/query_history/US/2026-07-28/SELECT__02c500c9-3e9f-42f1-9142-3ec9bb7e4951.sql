-- job_id: 02c500c9-3e9f-42f1-9142-3ec9bb7e4951
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:40:21.840000+00:00
-- started: 2026-07-28T13:40:21.905000+00:00
-- ended: 2026-07-28T13:40:22.158000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-36'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
