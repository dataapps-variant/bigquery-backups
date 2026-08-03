-- job_id: script_job_390a745a137dc77a916b1892052958fb_1
-- user: workflows-bq-runner@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-28T14:50:53.585000+00:00
-- started: 2026-07-28T14:50:54.031000+00:00
-- ended: 2026-07-28T14:54:08.247000+00:00

CREATE TEMP TABLE temp_cohort AS
WITH config2 AS (
  SELECT 7000 AS cohort_size
),
raw2 AS (
  SELECT 
    bl.report_date, bl.Product_Name_Final, bl.Country_Code, bl.billing_cycle,
    bl.calculated_bc_start_date, bl.calculated_denominator_bc,
    base.Updated_Cust_ID, base.Date_of_Sale, base.Order_Price_Net_of_Tax_USD,
    ROW_NUMBER() OVER (
      PARTITION BY bl.report_date, bl.Product_Name_Final, bl.Country_Code, bl.billing_cycle 
      ORDER BY base.Date_of_Sale DESC
    ) as transaction_rank
  FROM temp_bc bl
  INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON bl.Product_Name_Final = base.Product_Name_Final_Merged
    AND base.Billing_Cycle_Updated = bl.calculated_denominator_bc
    AND base.Date_of_Sale <= bl.calculated_bc_start_date
    AND (
      (bl.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR (bl.Country_Code = 'Non-JP' AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR (bl.Country_Code IS NULL OR bl.Country_Code = '')
    )
)
SELECT report_date, Product_Name_Final, Country_Code, billing_cycle,
  calculated_bc_start_date, calculated_denominator_bc,
  Updated_Cust_ID, Date_of_Sale, Order_Price_Net_of_Tax_USD
FROM raw2 WHERE transaction_rank <= (SELECT cohort_size FROM config2)
