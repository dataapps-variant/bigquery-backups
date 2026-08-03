-- job_id: scheduled_query_6a7cc771-0000-28e6-b3d0-001a11431baa
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-30T10:15:05.912000+00:00
-- started: 2026-07-30T10:15:06.227000+00:00
-- ended: 2026-07-30T10:15:08.685000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Utilities.CWC_base_data` AS
WITH
-- Get list of miscellaneous countries
miscellaneous_countries AS (
    SELECT Miscellaneous_Countries
    FROM `variant-finance-data-project.Sticky_Data.Miscellaneous_Countries`
),

-- User data with lookup and country replacement
user_data AS (
    SELECT 
        sticky.Date_of_Sale,
        -- First apply lookup, then CT country-based logic
        CASE 
            WHEN COALESCE(upd.Updated_App_Name, sticky.App_Name) = 'CT' AND sticky.Spend_Country_Code_AFID = 'JP' THEN 'CT-JP'
            WHEN COALESCE(upd.Updated_App_Name, sticky.App_Name) = 'CT' AND sticky.Spend_Country_Code_AFID != 'JP' THEN 'CT-Non-JP'
            ELSE COALESCE(upd.Updated_App_Name, sticky.App_Name)
        END AS App_Name,
        COALESCE(upd.Updated_Concat, sticky.Product_Name_Final) AS Plan_Name,
        LPAD(CAST(sticky.AFID_CHANNEL AS STRING), 2, '0') AS AFID_CHANNEL,
        CASE 
            WHEN EXISTS (SELECT 1 FROM miscellaneous_countries mc WHERE mc.Miscellaneous_Countries = sticky.Spend_Country_Code_AFID) THEN 'OR'
            ELSE sticky.Spend_Country_Code_AFID
        END AS Spend_Country_Code_AFID,
        sticky.Order_Id
    FROM 
        `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` sticky
    LEFT JOIN `variant-finance-data-project.Sticky_Data.R100_BQ_Updated_Product_Name` upd
        ON sticky.Product_Name_Final = upd.Concat
        AND sticky.App_Name = upd.App_Name
    WHERE 
        sticky.Billing_Cycle = '0'
        AND sticky.Date_of_Sale IS NOT NULL
        AND sticky.Product_Name_Final IS NOT NULL
        AND sticky.Date_of_Sale >= DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY)
),

-- Aggregate user data to prevent duplicates
user_aggregated AS (
    SELECT 
        Date_of_Sale,
        App_Name,
        Plan_Name,
        AFID_CHANNEL,
        Spend_Country_Code_AFID,
        COUNT(Order_Id) AS Metric,
        'USER' AS Source
    FROM user_data
    GROUP BY 
        Date_of_Sale,
        App_Name,
        Plan_Name,
        AFID_CHANNEL,
        Spend_Country_Code_AFID
),

-- Spend data with lookup (NO CT logic here)
spend_data AS (
    SELECT 
        spend.Date,
        COALESCE(upd.Updated_App_Name, spend.App_name) AS App_Name,
        COALESCE(upd.Updated_Concat, spend.Product_Name_final) AS Plan_Name,
        LPAD(CAST(spend.Channel_code AS STRING), 2, '0') AS Channel_code,
        CASE 
            WHEN EXISTS (SELECT 1 FROM miscellaneous_countries mc WHERE mc.Miscellaneous_Countries = spend.Country) THEN 'OR'
            ELSE spend.Country
        END AS Country,
        spend.allocated_spend
    FROM 
        `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` spend
    LEFT JOIN `variant-finance-data-project.Sticky_Data.R100_BQ_Updated_Product_Name` upd
        ON spend.Product_Name_final = upd.Concat
        AND spend.App_name = upd.App_Name
    WHERE 
        spend.Date IS NOT NULL
        AND spend.App_name IS NOT NULL
        AND spend.Product_Name_final IS NOT NULL
        AND spend.Date >= DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY)
),

-- Aggregate spend data to prevent duplicates
spend_aggregated AS (
    SELECT 
        Date AS Date_of_Sale,
        App_Name,
        Plan_Name,
        Channel_code AS AFID_CHANNEL,
        Country AS Spend_Country_Code_AFID,
        SUM(allocated_spend) AS Metric,
        'SPEND' AS Source
    FROM spend_data
    GROUP BY 
        Date,
        App_Name,
        Plan_Name,
        Channel_code,
        Country
),

-- Find spend combinations that don't exist in user data
missing_user_combinations AS (
    SELECT DISTINCT
        s.Date_of_Sale,
        s.App_Name,
        s.Plan_Name,
        s.AFID_CHANNEL,
        s.Spend_Country_Code_AFID
    FROM spend_aggregated s
    WHERE NOT EXISTS (
        SELECT 1 
        FROM user_aggregated u
        WHERE u.Date_of_Sale = s.Date_of_Sale
            AND u.App_Name = s.App_Name
            AND u.Plan_Name = s.Plan_Name
            AND u.AFID_CHANNEL = s.AFID_CHANNEL
            AND u.Spend_Country_Code_AFID = s.Spend_Country_Code_AFID
    )
),

-- Create placeholder user rows with 0 metric
placeholder_users AS (
    SELECT 
        Date_of_Sale,
        App_Name,
        Plan_Name,
        AFID_CHANNEL,
        Spend_Country_Code_AFID,
        0 AS Metric,
        'USER' AS Source
    FROM missing_user_combinations
),

-- Find user combinations that don't exist in spend data
missing_spend_combinations AS (
    SELECT DISTINCT
        u.Date_of_Sale,
        u.App_Name,
        u.Plan_Name,
        u.AFID_CHANNEL,
        u.Spend_Country_Code_AFID
    FROM user_aggregated u
    WHERE NOT EXISTS (
        SELECT 1 
        FROM spend_aggregated s
        WHERE s.Date_of_Sale = u.Date_of_Sale
            AND s.App_Name = u.App_Name
            AND s.Plan_Name = u.Plan_Name
            AND s.AFID_CHANNEL = u.AFID_CHANNEL
            AND s.Spend_Country_Code_AFID = u.Spend_Country_Code_AFID
    )
),

-- Create placeholder spend rows with 0 metric
placeholder_spend AS (
    SELECT 
        Date_of_Sale,
        App_Name,
        Plan_Name,
        AFID_CHANNEL,
        Spend_Country_Code_AFID,
        0 AS Metric,
        'SPEND' AS Source
    FROM missing_spend_combinations
)

-- Combine all data: actual users + placeholder users + actual spend + placeholder spend
SELECT * FROM user_aggregated
UNION ALL
SELECT * FROM placeholder_users
UNION ALL
SELECT * FROM spend_aggregated
UNION ALL
SELECT * FROM placeholder_spend

ORDER BY 
    Date_of_Sale DESC,
    App_Name,
    Plan_Name,
    AFID_CHANNEL,
    Spend_Country_Code_AFID,
    Source;
