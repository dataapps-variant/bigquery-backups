-- job_id: job_XEn4JlhaW_EeWFJpyE1UByUhNZ3v
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T15:07:03.014000+00:00
-- started: 2026-07-28T15:07:03.118000+00:00
-- ended: 2026-07-28T15:07:03.454000+00:00


  SELECT Curve_Name, COUNT(DISTINCT Input_ID) inputs, COUNT(DISTINCT Plan_Code) plans,
         STRING_AGG(DISTINCT Entity) entities
  FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
  GROUP BY Curve_Name ORDER BY inputs DESC LIMIT 15
