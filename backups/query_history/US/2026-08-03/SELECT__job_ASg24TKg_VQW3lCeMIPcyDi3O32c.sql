-- job_id: job_ASg24TKg_VQW3lCeMIPcyDi3O32c
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T10:02:12.161000+00:00
-- started: 2026-08-03T10:02:12.273000+00:00
-- ended: 2026-08-03T10:02:12.557000+00:00

WITH AFID_Cost AS (
    SELECT 
        -- CAST ensures Day is treated as text so SUBSTR doesn't fail
        SUBSTR(CAST(Day AS STRING), 1, 7) AS Month, 
        SUM(Cost) AS AFID_Total_Cost
    FROM 
        `variant-finance-data-project.Yahoo_Ads.AFID`
    GROUP BY 
        Month
),
Campaign_Cost AS (
    SELECT 
        SUBSTR(CAST(Day AS STRING), 1, 7) AS Month,
        SUM(Cost) AS Campaign_Total_Cost
    FROM 
        `variant-finance-data-project.Yahoo_Ads.Campaign`
    GROUP BY 
        Month
),
Country_Cost AS (
    SELECT 
        SUBSTR(CAST(Day AS STRING), 1, 7) AS Month,
        SUM(Cost) AS Country_Total_Cost
    FROM 
        `variant-finance-data-project.Yahoo_Ads.Country`
    GROUP BY 
        Month
)

SELECT 
    COALESCE(a.Month, c.Month, co.Month) AS Month,
    IFNULL(a.AFID_Total_Cost, 0) AS AFID_Total_Cost,
    IFNULL(c.Campaign_Total_Cost, 0) AS Campaign_Total_Cost,
    IFNULL(co.Country_Total_Cost, 0) AS Country_Total_Cost
FROM 
    AFID_Cost a
FULL OUTER JOIN 
    Campaign_Cost c ON a.Month = c.Month
FULL OUTER JOIN 
    Country_Cost co ON COALESCE(a.Month, c.Month) = co.Month
ORDER BY 
    Month DESC;
