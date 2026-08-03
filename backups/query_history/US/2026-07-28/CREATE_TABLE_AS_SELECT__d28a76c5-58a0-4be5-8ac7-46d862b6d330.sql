-- job_id: d28a76c5-58a0-4be5-8ac7-46d862b6d330
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-28T13:36:30.290000+00:00
-- started: 2026-07-28T13:36:30.579000+00:00
-- ended: 2026-07-28T13:36:32.346000+00:00


CREATE OR REPLACE TABLE `variant-finance-data-project.R100.R100_Historical_Refunds` AS
WITH product_lookup AS (
  SELECT App_Name, Concat, ANY_VALUE(Updated_Concat) AS Updated_Concat
  FROM `variant-finance-data-project.Sticky_Data.R100_BQ_Updated_Product_Name`
  GROUP BY App_Name, Concat
),
base AS (
  SELECT
    s.App_Name,
    s.Spend_Country_Code_AFID,
    s.AFID_CHANNEL,
    s.Billing_Cycle_Updated,
    s.Refund_Date,
    DATE(SAFE_CAST(s.Acquisition_Date_Time AS TIMESTAMP)) AS Day_First_Charge_Acquired,
    s.Refund_Amount_USD,
    COALESCE(p.Updated_Concat, s.Product_Name_Final) AS Plan_Name
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` s
  LEFT JOIN product_lookup p
    ON p.App_Name = s.App_Name
   AND p.Concat   = s.Product_Name_Final
  WHERE s.Refund_Amount_USD > 0
),
split AS (
  SELECT
    CASE
      WHEN App_Name = 'CT' AND Spend_Country_Code_AFID = 'JP' THEN 'CT-JP'
      WHEN App_Name = 'CT'                                    THEN 'CT-Non-JP'
      ELSE App_Name
    END AS Entity,
    Plan_Name, Billing_Cycle_Updated, Day_First_Charge_Acquired,
    Refund_Date, AFID_CHANNEL, Spend_Country_Code_AFID, Refund_Amount_USD
  FROM base
),
matched AS (
  SELECT
    i.Input_ID, b.Entity, b.Plan_Name, b.Billing_Cycle_Updated,
    b.Day_First_Charge_Acquired, b.Refund_Date, b.Refund_Amount_USD
  FROM split b
  JOIN `variant-finance-data-project.R100.R100_Input_Selection` i
    ON i.Entity    = b.Entity
   AND i.Plan_Code = b.Plan_Name
   AND i.Inputs_to_Process = TRUE
   AND (i.AFID_Channel IS NULL OR i.AFID_Channel = ''
        OR CAST(b.AFID_CHANNEL AS STRING) IN UNNEST(SPLIT(i.AFID_Channel, ',')))
   AND (i.Country_Code IS NULL OR i.Country_Code = ''
        OR b.Spend_Country_Code_AFID IN UNNEST(SPLIT(i.Country_Code, ',')))
)
SELECT
  Input_ID,
  Entity,
  Plan_Name,
  Billing_Cycle_Updated              AS Billing_Cycle,
  Day_First_Charge_Acquired,
  Refund_Date                        AS Day_Refunded,
  SUM(Refund_Amount_USD)             AS Refund_Amount
FROM matched
GROUP BY
  Input_ID, Entity, Plan_Name, Billing_Cycle, Day_First_Charge_Acquired, Day_Refunded;
