-- job_id: job_DOrsBJqy5zXyYVxAP_z2bjLQfyY5
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:38:39.610000+00:00
-- started: 2026-07-28T14:38:39.728000+00:00
-- ended: 2026-07-28T14:38:39.852000+00:00

SELECT Input_ID, Day_Refunded, SUM(Refund_Amount) AS amt
   FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
   WHERE Day_Refunded IS NOT NULL
   GROUP BY Input_ID, Day_Refunded
