-- job_id: a4c6a34b-fd86-4735-af4e-e6fa16e8d1fc
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:39:32.174000+00:00
-- started: 2026-07-28T13:39:32.278000+00:00
-- ended: 2026-07-28T13:39:32.449000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-28'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
