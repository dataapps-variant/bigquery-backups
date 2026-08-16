-- =====================================================
-- TABLE: ICARUS_Multi.Regular_Vs_CB
-- PURPOSE: Compare Regular vs Crystal Ball (CB) methodologies side-by-side
-- 
-- LOGIC:
--   - Pull Regular data as-is from Final_Table (Table = 'Regular')
--   - Pull CB data from Final_Table (Table = 'Crystal Ball')
--   - CB metrics are matched using Report_Date = Regular_Date - 30 days
--   - LEFT JOIN ensures all Regular rows are retained
--
-- JOIN CONDITIONS:
--   - Plan_Name, Active_Inactive, BC, Entity_Name, App_Name, Trial_Type, Cohort
--   - Regular.Reporting_Date = CB.Reporting_Date + 30 days
--
-- OUTPUT: 37 columns (Regular metrics + CB metrics side-by-side)
-- =====================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.ICARUS_Multi.Regular_Vs_CB` AS

WITH 
-- =====================================================
-- STEP 1: EXTRACT REGULAR DATA
-- Filter Final_Table for Table = 'Regular'
-- =====================================================
regular_data AS (
    SELECT
        Reporting_Date,
        Plan_Name,
        Active_Inactive,
        BC,
        Entity_Name,
        App_Name,
        Trial_Type,
        Country,
        Subscriptions,
        Rebills,
        Single_Sale,
        Churn_Rate,
        Refund_Rate,
        Gross_ARPU_Retention_Rate,
        Net_ARPU_Retention_Rate,
        Cohort_CAC,
        Recent_CAC,
        T30D_New_Users,
        Gross_ARPU_Discounted,
        Net_ARPU_Discounted,
        Net_LTV_Discounted,
        BC4_CAC_Ceiling,
        Cohort
    FROM `variant-finance-data-project.ICARUS_Multi.Final_Table`
    WHERE Table = 'Regular'
),

-- =====================================================
-- STEP 2: EXTRACT CRYSTAL BALL (CB) DATA
-- Filter Final_Table for Table = 'Crystal Ball'
-- =====================================================
cb_data AS (
    SELECT
        Reporting_Date,
        Plan_Name,
        Active_Inactive,
        BC,
        Entity_Name,
        App_Name,
        Trial_Type,
        Country,
        Subscriptions,
        Rebills,
        Single_Sale,
        Churn_Rate,
        Refund_Rate,
        Gross_ARPU_Retention_Rate,
        Net_ARPU_Retention_Rate,
        Cohort_CAC,
        Recent_CAC,
        T30D_New_Users,
        Gross_ARPU_Discounted,
        Net_ARPU_Discounted,
        Net_LTV_Discounted,
        BC4_CAC_Ceiling,
        Cohort
    FROM `variant-finance-data-project.ICARUS_Multi.Final_Table`
    WHERE Table = 'Crystal Ball'
)

-- =====================================================
-- STEP 3: LEFT JOIN REGULAR WITH CB
-- CB data matched on Regular_Date - 30 days
-- All Regular rows retained even if no CB match exists
-- =====================================================
SELECT
    -- Dimension Columns (from Regular - Primary)
    r.Reporting_Date AS Reporting_Date_Regular,
    r.Plan_Name,
    r.Active_Inactive,
    r.BC,
    r.Entity_Name,
    r.App_Name,
    r.Trial_Type,
    
    -- Regular Metrics
    r.Subscriptions AS Subscriptions_Regular,
    r.Rebills AS Rebills_Regular,
    r.Single_Sale AS Single_Sale_Regular,
    r.Churn_Rate AS Churn_Rate_Regular,
    r.Refund_Rate AS Refund_Rate_Regular,
    r.Gross_ARPU_Retention_Rate AS Gross_ARPU_Retention_Rate_Regular,
    r.Net_ARPU_Retention_Rate AS Net_ARPU_Retention_Rate_Regular,
    r.Cohort_CAC AS Cohort_CAC_Regular,
    r.Recent_CAC AS Recent_CAC_Regular,
    r.T30D_New_Users AS T30D_New_Users_Regular,
    r.Gross_ARPU_Discounted AS Gross_ARPU_Discounted_Regular,
    r.Net_ARPU_Discounted AS Net_ARPU_Discounted_Regular,
    r.Net_LTV_Discounted AS Net_LTV_Discounted_Regular,
    r.BC4_CAC_Ceiling AS BC4_CAC_Ceiling_Regular,
    
    -- CB Reporting Date (Regular Date - 30 days)
    DATE_SUB(r.Reporting_Date, INTERVAL 30 DAY) AS Reporting_Date_CB,
    
    -- CB Metrics (from Crystal Ball table, matched on date - 30 days)
    cb.Subscriptions AS Subscriptions_CB,
    cb.Rebills AS Rebills_CB,
    cb.Single_Sale AS Single_Sale_CB,
    cb.Churn_Rate AS Churn_Rate_CB,
    cb.Refund_Rate AS Refund_Rate_CB,
    cb.Gross_ARPU_Retention_Rate AS Gross_ARPU_Retention_Rate_CB,
    cb.Net_ARPU_Retention_Rate AS Net_ARPU_Retention_Rate_CB,
    cb.Cohort_CAC AS Cohort_CAC_CB,
    cb.Recent_CAC AS Recent_CAC_CB,
    cb.T30D_New_Users AS T30D_New_Users_CB,
    cb.Gross_ARPU_Discounted AS Gross_ARPU_Discounted_CB,
    cb.Net_ARPU_Discounted AS Net_ARPU_Discounted_CB,
    cb.Net_LTV_Discounted AS Net_LTV_Discounted_CB,
    cb.BC4_CAC_Ceiling AS BC4_CAC_Ceiling_CB,
    
    -- Cohort (same for both, from Regular)
    r.Cohort

FROM regular_data r

LEFT JOIN cb_data cb
    ON r.Plan_Name = cb.Plan_Name
    AND r.Active_Inactive = cb.Active_Inactive
    AND r.BC = cb.BC
    AND r.Entity_Name = cb.Entity_Name
    AND r.App_Name = cb.App_Name
    AND r.Trial_Type = cb.Trial_Type
    AND r.Cohort = cb.Cohort
    -- KEY JOIN: Regular date = CB date + 30 days
    -- i.e., CB date = Regular date - 30 days
    AND DATE_SUB(r.Reporting_Date, INTERVAL 30 DAY) = cb.Reporting_Date

ORDER BY
    Reporting_Date_Regular DESC,
    Plan_Name,
    Cohort,
    BC;

-- =====================================================
-- SCRIPT COMPLETE
-- Table: variant-finance-data-project.ICARUS_Multi.Regular_Vs_CB
--
-- OUTPUT SCHEMA (37 columns):
--   1.  Reporting_Date_Regular      DATE
--   2.  Plan_Name                   STRING
--   3.  Active_Inactive             STRING
--   4.  BC                          INTEGER
--   5.  Entity_Name                 STRING
--   6.  App_Name                    STRING
--   7.  Trial_Type                  STRING
--   8.  Subscriptions_Regular       INTEGER
--   9.  Rebills_Regular             FLOAT
--   10. Single_Sale_Regular         INTEGER
--   11. Churn_Rate_Regular          FLOAT
--   12. Refund_Rate_Regular         FLOAT
--   13. Gross_ARPU_Retention_Rate_Regular  FLOAT
--   14. Net_ARPU_Retention_Rate_Regular    FLOAT
--   15. Cohort_CAC_Regular          FLOAT
--   16. Recent_CAC_Regular          FLOAT
--   17. T30D_New_Users_Regular      INTEGER
--   18. Gross_ARPU_Discounted_Regular      FLOAT
--   19. Net_ARPU_Discounted_Regular        FLOAT
--   20. Net_LTV_Discounted_Regular         FLOAT
--   21. BC4_CAC_Ceiling_Regular     FLOAT
--   22. Reporting_Date_CB           DATE
--   23. Subscriptions_CB            INTEGER
--   24. Rebills_CB                  FLOAT
--   25. Single_Sale_CB              INTEGER
--   26. Churn_Rate_CB               FLOAT
--   27. Refund_Rate_CB              FLOAT
--   28. Gross_ARPU_Retention_Rate_CB       FLOAT
--   29. Net_ARPU_Retention_Rate_CB         FLOAT
--   30. Cohort_CAC_CB               FLOAT
--   31. Recent_CAC_CB               FLOAT
--   32. T30D_New_Users_CB           INTEGER
--   33. Gross_ARPU_Discounted_CB           FLOAT
--   34. Net_ARPU_Discounted_CB             FLOAT
--   35. Net_LTV_Discounted_CB              FLOAT
--   36. BC4_CAC_Ceiling_CB          FLOAT
--   37. Cohort                      STRING
--
-- COMPARISON USE CASE:
--   For any given Regular date, you can compare metrics with
--   CB predictions made 30 days earlier (CB date = Regular - 30)
--   This allows validation of Crystal Ball forecasting accuracy
-- =====================================================
