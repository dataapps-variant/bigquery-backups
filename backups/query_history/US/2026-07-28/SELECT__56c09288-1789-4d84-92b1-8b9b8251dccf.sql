-- job_id: 56c09288-1789-4d84-92b1-8b9b8251dccf
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:10:39.949000+00:00
-- started: 2026-07-28T13:10:40.042000+00:00
-- ended: 2026-07-28T13:10:40.382000+00:00


    SELECT Input_ID, Channel_Bucket, spend_date, SUM(spend_usd) AS spend
    FROM `variant-finance-data-project.R100.R100_Historical_Spend`
    WHERE spend_date BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
    GROUP BY 1, 2, 3
