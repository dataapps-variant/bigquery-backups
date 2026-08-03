-- job_id: 76b4a943-a94d-4af0-8a82-cad78d9bd203
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:42:45.641000+00:00
-- started: 2026-07-28T13:42:45.742000+00:00
-- ended: 2026-07-28T13:42:45.942000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-59'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
