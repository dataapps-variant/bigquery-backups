-- =============================================================================
-- Revenue_VAT : MONTHLY pre-aggregated VAT-by-country report
-- =============================================================================
-- Grain      : one row per
--              (sale_month x Tax_Country_Code x Entity_Name x Product_Name_Final_Merged)
-- Filters    : Test = '0' only; Date_of_Sale >= 2026-01-01; Date_of_Sale NOT NULL
-- Country    : Tax_Country_Code (existing field, used as-is)
-- Money basis: Order_Price_Net_of_Tax_USD / _Native_Currency (net of tax)
-- Date anchor: Date_of_Sale, truncated to month
--
-- REFUND / CHARGEBACK BUCKETS (disjoint where it matters for Net):
--   refunded_wo_chargeback_usd : refund=yes AND chargeback=no
--   refunds_usd (Refunded)     : ALL refund=yes  (incl. refund=yes & chargeback=yes)
--   chargeback_usd (CB Lost)   : chargeback=yes AND refund=no
--   Net = Gross - Refunded - Chargeback Lost  (refund=yes vs refund=no -> no overlap)
--
-- NOTE ON COUNTS: count_* columns are DISTINCT-per-(month x product). Exact for a
-- single month at product grain; OVERCOUNT when summed across months or products
-- (e.g. rolling product up to entity). All money SUMS roll up correctly.
-- =============================================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Data.Revenue_VAT` AS

WITH base AS (
    SELECT
        DATE_TRUNC(Date_of_Sale, MONTH)         AS sale_month,
        Tax_Country_Code,
        Entity_Name,
        Product_Name_Final_Merged,
        Updated_Cust_ID,
        Currency,
        Order_Price_Net_of_Tax_USD              AS net_revenue_usd,
        Order_Price_Net_of_Tax_Native_Currency  AS net_revenue_native,
        Refund_Amount_USD,
        (Final_Order_Status IN (2, 6))          AS is_approved,
        (TRIM(Is_Chargeback) = '1')             AS is_chargeback,
        (LOWER(TRIM(Is_Refund)) = 'yes')        AS is_refund
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    WHERE TRIM(Test) = '0'
      AND Date_of_Sale IS NOT NULL
      AND Date_of_Sale >= DATE '2026-01-01'
)

SELECT
    sale_month,
    Tax_Country_Code,
    Entity_Name,
    Product_Name_Final_Merged,
    ANY_VALUE(Currency)                                                        AS currency,

    -- distinct-customer counts (per month x product; see note above)
    COUNT(DISTINCT IF(is_approved, Updated_Cust_ID, NULL))                     AS approved_orders,
    COUNT(DISTINCT IF(is_chargeback AND NOT is_refund, Updated_Cust_ID, NULL)) AS count_chargeback,
    COUNT(DISTINCT IF(is_refund, Updated_Cust_ID, NULL))                       AS count_refunds,

    -- revenue (net of tax)
    SUM(net_revenue_usd)                                                       AS gross_revenue_usd,
    SUM(net_revenue_native)                                                    AS gross_revenue_native,

    -- refund / chargeback dollar buckets
    SUM(IF(is_refund AND NOT is_chargeback, Refund_Amount_USD, 0))             AS refunded_wo_chargeback_usd,
    SUM(IF(is_chargeback AND NOT is_refund, Refund_Amount_USD, 0))             AS chargeback_usd,
    SUM(IF(is_refund, Refund_Amount_USD, 0))                                   AS refunds_usd,

    -- Net = Gross - Refunded(all refund=yes) - Chargeback Lost(cb & refund=no)
    SUM(net_revenue_usd)
      - SUM(IF(is_refund, Refund_Amount_USD, 0))
      - SUM(IF(is_chargeback AND NOT is_refund, Refund_Amount_USD, 0))         AS net_revenue_usd

FROM base
GROUP BY sale_month, Tax_Country_Code, Entity_Name, Product_Name_Final_Merged
ORDER BY sale_month, Tax_Country_Code, Entity_Name, Product_Name_Final_Merged;
