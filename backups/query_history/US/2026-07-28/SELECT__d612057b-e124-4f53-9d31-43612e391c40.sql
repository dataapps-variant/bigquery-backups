-- job_id: d612057b-e124-4f53-9d31-43612e391c40
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:38:10.634000+00:00
-- started: 2026-07-28T13:38:10.711000+00:00
-- ended: 2026-07-28T13:38:10.907000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-15'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
