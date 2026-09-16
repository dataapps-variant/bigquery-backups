CREATE OR REPLACE TABLE `variant-finance-data-project.R100.EN_Refunds` AS
WITH 
-- Find products from other apps that map to EN
cross_app_products AS (
    SELECT DISTINCT
        App_Name,
        Product_Name
    FROM `variant-finance-data-project.Sticky_Data.R100_BQ_Updated_Product_Name`
    WHERE Updated_App_Name = 'EN'
        AND App_Name != 'EN'
),

base_refunds AS (
    -- Direct EN refunds
    SELECT 
        Refund_Date AS Day_Refunded,
        App_name AS App_Name,
        CONCAT(
            CASE 
                WHEN LENGTH(Product_Name_updated) < 4 
                THEN LPAD(Product_Name_updated, 4, '0')
                ELSE Product_Name_updated
            END,
            COALESCE(Trial_Type, '')
        ) AS Plan_Name,
        DATE(Acquisition_Date_Time) AS Day_First_Charge_Acquired,
        CONCAT(
            LPAD(CAST(AFID_CHANNEL AS STRING), 2, '0'),
            COALESCE(Spend_Country_Code_AFID, '')
        ) AS COHORT,
        CAST(NULL AS STRING) AS Initial_Gateway_ID,
        CAST(NULL AS STRING) AS Current_Gateway_ID,
        Billing_Cycle_Updated AS Billing_Cycle,
        SUM(Refund_Amount_USD) AS Refunded_Amount
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    WHERE App_name = 'EN'
        AND Refund_Date >= DATE_SUB(CURRENT_DATE(), INTERVAL 100 DAY)
        AND Refund_Date IS NOT NULL
    GROUP BY 
        Refund_Date,
        App_name,
        CONCAT(
            CASE 
                WHEN LENGTH(Product_Name_updated) < 4 
                THEN LPAD(Product_Name_updated, 4, '0')
                ELSE Product_Name_updated
            END,
            COALESCE(Trial_Type, '')
        ),
        DATE(Acquisition_Date_Time),
        CONCAT(
            LPAD(CAST(AFID_CHANNEL AS STRING), 2, '0'),
            COALESCE(Spend_Country_Code_AFID, '')
        ),
        Billing_Cycle_Updated

    UNION ALL

    -- Refunds from other apps that map to EN
    SELECT 
        sticky.Refund_Date AS Day_Refunded,
        sticky.App_name AS App_Name,
        CONCAT(
            CASE 
                WHEN LENGTH(sticky.Product_Name_updated) < 4 
                THEN LPAD(sticky.Product_Name_updated, 4, '0')
                ELSE sticky.Product_Name_updated
            END,
            COALESCE(sticky.Trial_Type, '')
        ) AS Plan_Name,
        DATE(sticky.Acquisition_Date_Time) AS Day_First_Charge_Acquired,
        CONCAT(
            LPAD(CAST(sticky.AFID_CHANNEL AS STRING), 2, '0'),
            COALESCE(sticky.Spend_Country_Code_AFID, '')
        ) AS COHORT,
        CAST(NULL AS STRING) AS Initial_Gateway_ID,
        CAST(NULL AS STRING) AS Current_Gateway_ID,
        sticky.Billing_Cycle_Updated AS Billing_Cycle,
        SUM(sticky.Refund_Amount_USD) AS Refunded_Amount
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` sticky
    INNER JOIN cross_app_products cap
        ON sticky.App_name = cap.App_Name
        AND CONCAT(
            CASE 
                WHEN LENGTH(sticky.Product_Name_updated) < 4 
                THEN LPAD(sticky.Product_Name_updated, 4, '0')
                ELSE sticky.Product_Name_updated
            END,
            COALESCE(sticky.Trial_Type, '')
        ) = cap.Product_Name
    WHERE sticky.Refund_Date >= DATE_SUB(CURRENT_DATE(), INTERVAL 100 DAY)
        AND sticky.Refund_Date IS NOT NULL
    GROUP BY 
        sticky.Refund_Date,
        sticky.App_name,
        CONCAT(
            CASE 
                WHEN LENGTH(sticky.Product_Name_updated) < 4 
                THEN LPAD(sticky.Product_Name_updated, 4, '0')
                ELSE sticky.Product_Name_updated
            END,
            COALESCE(sticky.Trial_Type, '')
        ),
        DATE(sticky.Acquisition_Date_Time),
        CONCAT(
            LPAD(CAST(sticky.AFID_CHANNEL AS STRING), 2, '0'),
            COALESCE(sticky.Spend_Country_Code_AFID, '')
        ),
        sticky.Billing_Cycle_Updated
)

-- Final SELECT with lookup to update App_Name and Plan_Name
SELECT 
    base.Day_Refunded,
    COALESCE(upd.Updated_App_Name, base.App_Name) AS App_Name,
    COALESCE(upd.Updated_Product_Name, base.Plan_Name) AS Plan_Name,
    base.Day_First_Charge_Acquired,
    base.COHORT,
    base.Initial_Gateway_ID,
    base.Current_Gateway_ID,
    base.Billing_Cycle,
    base.Refunded_Amount
FROM base_refunds base
LEFT JOIN `variant-finance-data-project.Sticky_Data.R100_BQ_Updated_Product_Name` upd
    ON base.Plan_Name = upd.Product_Name
    AND base.App_Name = upd.App_Name  -- ✅ CRITICAL: Join on BOTH fields to prevent duplication
WHERE COALESCE(upd.Updated_App_Name, base.App_Name) = 'EN'
ORDER BY Day_Refunded DESC;
