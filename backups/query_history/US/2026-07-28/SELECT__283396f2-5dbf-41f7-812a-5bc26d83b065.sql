-- job_id: 283396f2-5dbf-41f7-812a-5bc26d83b065
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:36:59.259000+00:00
-- started: 2026-07-28T13:36:59.637000+00:00
-- ended: 2026-07-28T13:36:59.879000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-4'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
