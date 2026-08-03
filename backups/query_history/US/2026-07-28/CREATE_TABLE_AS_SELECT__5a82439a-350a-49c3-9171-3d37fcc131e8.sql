-- job_id: 5a82439a-350a-49c3-9171-3d37fcc131e8
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-28T13:10:14.856000+00:00
-- started: 2026-07-28T13:10:15.223000+00:00
-- ended: 2026-07-28T13:10:36.894000+00:00


CREATE OR REPLACE TABLE `variant-finance-data-project.R100.R100_Historical_Spend`
PARTITION BY spend_date
CLUSTER BY Input_ID, Plan_Code
AS
WITH
base_spend AS (
  SELECT
    s.Date AS spend_date,
    s.App_Name AS Entity,
    s.Channel_code,
    s.Channel_name,
    s.Country,
    s.allocated_spend,
    COALESCE(map.Updated_Concat, s.Product_Name_final) AS Plan_Code
  FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` AS s
  LEFT JOIN `variant-finance-data-project.Sticky_Data.R100_BQ_Updated_Product_Name` AS map
    ON s.Product_Name_final = map.Concat
  WHERE s.Date IS NOT NULL
    AND s.App_Name IS NOT NULL
    AND s.Product_Name_final IS NOT NULL
),
bucketed AS (
  SELECT
    *,
    CASE
      WHEN UPPER(COALESCE(Channel_name, '')) LIKE '%GOOGLE%' THEN 'Google_Ads'
      WHEN UPPER(COALESCE(Channel_name, '')) LIKE '%MS%'     THEN 'MS_Ads'
      ELSE 'Other_Ads'
    END AS Channel_Bucket
  FROM base_spend
),
input_rules AS (
  SELECT
    Input_ID,
    Entity,
    Plan_Code,
    AFID_Channel  AS afid_filter_str,
    Country_Code  AS country_filter_str
  FROM `variant-finance-data-project.R100.R100_Input_Selection_Spend`
  WHERE Inputs_to_Process = TRUE
),
filtered AS (
  SELECT
    r.Input_ID,
    b.Entity,
    b.Plan_Code,
    b.Channel_Bucket,
    b.spend_date,
    b.allocated_spend
  FROM bucketed AS b
  INNER JOIN input_rules AS r
    ON b.Entity = r.Entity
   AND b.Plan_Code = r.Plan_Code
  WHERE (r.afid_filter_str IS NULL
         OR CAST(b.Channel_code AS STRING) IN UNNEST(SPLIT(r.afid_filter_str, ',')))
    AND (r.country_filter_str IS NULL
         OR b.Country IN UNNEST(SPLIT(r.country_filter_str, ',')))
)
SELECT
  Input_ID,
  Entity,
  Plan_Code,
  Channel_Bucket,
  spend_date,
  SUM(allocated_spend) AS spend_usd,
  CURRENT_TIMESTAMP() AS loaded_at
FROM filtered
GROUP BY Input_ID, Entity, Plan_Code, Channel_Bucket, spend_date
