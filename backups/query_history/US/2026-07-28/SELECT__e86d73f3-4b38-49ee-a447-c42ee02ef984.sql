-- job_id: e86d73f3-4b38-49ee-a447-c42ee02ef984
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T06:38:44.935000+00:00
-- started: 2026-07-28T06:38:45.018000+00:00
-- ended: 2026-07-28T06:38:45.521000+00:00


WITH base_afids AS (
  SELECT DISTINCT App_Name, AFID
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE AFID IS NOT NULL AND App_Name IS NOT NULL
),
recent_counts AS (
  SELECT App_Name,
         AFID,
         COUNT(DISTINCT Updated_Cust_ID) AS user_count
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE AFID IS NOT NULL
    AND App_Name IS NOT NULL
    AND Date_of_Sale >= DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY)
    AND (
      (Trial_Type = 'NT' AND Billing_Cycle_Updated = 1)
      OR (Trial_Type != 'NT' AND Billing_Cycle_Updated = 0)
    )
  GROUP BY App_Name, AFID
)
SELECT b.App_Name,
       ARRAY_AGG(b.AFID
                 ORDER BY COALESCE(r.user_count, 0) DESC, b.AFID ASC) AS afids
FROM base_afids b
LEFT JOIN recent_counts r
  USING (App_Name, AFID)
GROUP BY b.App_Name
