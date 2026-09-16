CREATE VIEW `variant-finance-data-project.chargebee.Chargebee_data_API_original_PD_V_W_EC`
AS WITH

Base AS (
  SELECT
    CB.*,

    -- Entity code: map Chargebee site org to the Sticky entity code
    CASE
      WHEN CB.site_org_name = 'PDF Dot Net LLC' THEN 'PD'
      ELSE CB.site_org_name
    END AS Entity_Code,

    -- App code: map Chargebee product family to the Sticky app code
    CASE
      WHEN CB.family_id = 'pdf-net' THEN 'PD'
      ELSE CB.family_id
    END AS App_Code,

    ------------------------------------------------------------------
    -- Epoch seconds -> TIMESTAMP (SAFE_CAST handles INT64 or STRING storage)
    ------------------------------------------------------------------
    TIMESTAMP_SECONDS(SAFE_CAST(CB.invoice_date AS INT64))                 AS invoice_ts,
    TIMESTAMP_SECONDS(SAFE_CAST(CB.invoice_updated_at AS INT64))          AS invoice_updated_ts,
    TIMESTAMP_SECONDS(SAFE_CAST(CB.customer_created_at AS INT64))         AS customer_created_ts,
    TIMESTAMP_SECONDS(SAFE_CAST(CB.next_billing_at AS INT64))             AS next_billing_ts,
    TIMESTAMP_SECONDS(SAFE_CAST(CB.dunning_attempt_1_created_at AS INT64)) AS dunning_1_ts,
    TIMESTAMP_SECONDS(SAFE_CAST(CB.transaction_date AS INT64))            AS transaction_ts,
    TIMESTAMP_SECONDS(SAFE_CAST(CB.cn_refunded_at AS INT64))              AS cn_refunded_ts,

    ------------------------------------------------------------------
    -- Money: cents -> currency units
    ------------------------------------------------------------------
    SAFE_DIVIDE(SAFE_CAST(CB.invoice_total AS FLOAT64), 100)                    AS invoice_total_amt,
    SAFE_DIVIDE(SAFE_CAST(CB.invoice_sub_total AS FLOAT64), 100)                AS invoice_sub_total_amt,
    SAFE_DIVIDE(SAFE_CAST(CB.tax AS FLOAT64), 100)                              AS tax_amt,
    SAFE_DIVIDE(SAFE_CAST(CB.plan_unit_price AS FLOAT64), 100)                  AS plan_unit_price_amt,
    SAFE_DIVIDE(SAFE_CAST(CB.price AS FLOAT64), 100)                            AS product_price_amt,
    SAFE_DIVIDE(SAFE_CAST(CB.trial_charge_unit_price AS FLOAT64), 100)          AS trial_price_amt,
    SAFE_DIVIDE(SAFE_CAST(CB.cn_total_amount_refunded AS FLOAT64), 100)         AS refund_amt,
    SAFE_DIVIDE(SAFE_CAST(CB.line1_item_level_discount_amount AS FLOAT64), 100) AS rebill_discount_amt,

    -- Exchange rate: 1.0 for USD, else Chargebee's rate (default 1.0 if missing)
    CASE
      WHEN UPPER(CB.invoice_currency_code) = 'USD' THEN 1.0
      ELSE COALESCE(SAFE_CAST(CB.invoice_exchange_rate AS FLOAT64), 1.0)
    END AS fx_rate,

    ------------------------------------------------------------------
    -- Tracking fields: coalesce across the three Chargebee sources
    -- (top-level flattened, cf_*, meta_data_*, customer_cf_*)
    ------------------------------------------------------------------
    COALESCE(NULLIF(CB.afid,''), NULLIF(CB.cf_afid,''), NULLIF(CB.meta_data_afid,''), NULLIF(CB.customer_cf_afid,'')) AS afid_final,
    COALESCE(NULLIF(CB.sid,''),  NULLIF(CB.cf_sid,''),  NULLIF(CB.meta_data_sid,''),  NULLIF(CB.customer_cf_sid,''))  AS sid_final,
    COALESCE(NULLIF(CB.c1,''),   NULLIF(CB.cf_c1,''),   NULLIF(CB.meta_data_c1,''),   NULLIF(CB.customer_cf_c1,''))   AS c1_final,
    COALESCE(NULLIF(CB.c2,''),   NULLIF(CB.cf_c2,''),   NULLIF(CB.meta_data_c2,''),   NULLIF(CB.customer_cf_c2,''))   AS c2_final,
    COALESCE(NULLIF(CB.c3,''),   NULLIF(CB.cf_c3,''),   NULLIF(CB.meta_data_c3,''),   NULLIF(CB.customer_cf_c3,''))   AS c3_final,
    COALESCE(NULLIF(CB.aid,''),  NULLIF(CB.cf_aid,''),  NULLIF(CB.meta_data_aid,''),  NULLIF(CB.customer_cf_aid,''))  AS aid_final,
    COALESCE(NULLIF(CB.opt,''),  NULLIF(CB.cf_opt,''),  NULLIF(CB.meta_data_opt,''),  NULLIF(CB.customer_cf_opt,''))  AS opt_final,
    COALESCE(NULLIF(CB.campaign_id,''), NULLIF(CB.cf_campaign_id,''), NULLIF(CB.meta_data_campaign_id,''), NULLIF(CB.customer_cf_campaign_id,'')) AS campaign_id_final,

    ------------------------------------------------------------------
    -- Billing cycle DERIVED: invoice sequence per subscription, 0-based.
    -- 0 = first invoice (the trial charge), 1 = first rebill, etc.
    -- This matches Sticky's Billing_Cycle meaning (which rebill this is).
    -- Chargebee's billing_period (= 1 for monthly) means plan length, NOT this.
    ------------------------------------------------------------------
    -- Tie-breaker uses invoice_id as STRING because most ids are not numeric
    -- (e.g. 'INV1009202612'), so a numeric cast would turn them NULL
    ROW_NUMBER() OVER (
      PARTITION BY CB.subscription_id
      ORDER BY SAFE_CAST(CB.invoice_date AS INT64), CAST(CB.invoice_id AS STRING)
    ) - 1 AS billing_cycle_num

  FROM `variant-finance-data-project.chargebee.fct_orders_full` AS CB
)

SELECT
  'Chargebee'                                                     AS Platform,
  ------------------------------------------------------------------
  -- 1-12: order header + billing details
  ------------------------------------------------------------------
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', B.invoice_updated_ts)     AS last_updated,
  CAST(B.invoice_id AS STRING)                                    AS Order_Id,
  CAST(B.billing_first_name AS STRING)                            AS Bill_First,
  CAST(B.billing_last_name AS STRING)                             AS Bill_Last,
  CAST(B.cust_city AS STRING)                                     AS Bill_Address1,  -- no street-line column exists; per mapping sheet
  CAST(B.cust_city AS STRING)                                     AS Bill_Address2,  -- per mapping sheet
  CAST(B.billing_city AS STRING)                                  AS Bill_City,
  CAST(B.billing_state_code AS STRING)                            AS Bill_State,
  CAST(B.billing_zip AS STRING)                                   AS Bill_Zip,
  CAST(B.billing_country AS STRING)                               AS Bill_Country,
  CAST(NULL AS STRING)                                            AS Bill_Phone,
  CAST(B.customer_email AS STRING)                                AS Bill_Email,

  ------------------------------------------------------------------
  -- 13-22: shipping details
  ------------------------------------------------------------------
  CAST(B.cust_first_name AS STRING)                               AS Ship_First,
  CAST(B.cust_last_name AS STRING)                                AS Ship_Last,
  CAST(B.cust_city AS STRING)                                     AS Ship_Address1,  -- per mapping sheet
  CAST(B.cust_city AS STRING)                                     AS Ship_Address2,  -- per mapping sheet
  CAST(B.cust_city AS STRING)                                     AS Ship_City,
  CAST(B.cust_state_code AS STRING)                               AS Ship_State,     -- cust_state is blank in data; state_code has the value
  CAST(B.cust_zip AS STRING)                                      AS Ship_Zip,
  CAST(B.cust_country AS STRING)                                  AS Ship_Country,
  CAST(NULL AS STRING)                                            AS Ship_Method_Name,
  CAST(NULL AS STRING)                                            AS Ship_Price,

  ------------------------------------------------------------------
  -- 23-28: totals, tax, sale date + timestamp split
  ------------------------------------------------------------------
  FORMAT('%.2f', B.invoice_sub_total_amt)                         AS Sub_Total,
  CAST(B.line_tax_1_tax_rate AS STRING)                           AS Sales_Tax_Percent,  -- null in current data
  CAST(B.line_tax_1_tax_rate AS STRING)                           AS Sales_Tax_Factor,   -- null in current data
  FORMAT('%.2f', B.invoice_total_amt)                             AS Order_Total,
  DATE(B.invoice_ts)                                              AS Date_of_Sale,
  FORMAT_TIMESTAMP('%H:%M:%S', B.invoice_ts)                      AS Time_Stamp,

  ------------------------------------------------------------------
  -- 29-40: payment / card / gateway / IP
  ------------------------------------------------------------------
  CAST(NULL AS STRING)                                            AS Tracking_Number,
  -- Payment: translate Chargebee's method/brand to Sticky's exact labels
  -- (googlepay, visa, applepay, amex, paypal, discover, master).
  -- Wallets take priority; plain cards use the card brand. Anything with
  -- no Sticky equivalent passes through as its raw Chargebee value.
  CASE LOWER(CAST(B.payment_method AS STRING))
    WHEN 'google_pay'              THEN 'googlepay'
    WHEN 'apple_pay'               THEN 'applepay'
    WHEN 'paypal_express_checkout' THEN 'paypal'
    WHEN 'paypal'                  THEN 'paypal'
    WHEN 'card' THEN
      CASE LOWER(CAST(B.txn_card_brand AS STRING))
        WHEN 'visa'             THEN 'visa'
        WHEN 'mastercard'       THEN 'master'
        WHEN 'master'           THEN 'master'
        WHEN 'american_express' THEN 'amex'
        WHEN 'amex'             THEN 'amex'
        WHEN 'discover'         THEN 'discover'
        ELSE NULLIF(CAST(B.txn_card_brand AS STRING), '')  -- unmapped brand, raw
      END
    ELSE CAST(B.payment_method AS STRING)  -- unmapped method, raw
  END                                                             AS Payment,
  CAST(B.campaign_id_final AS STRING)                             AS Campaign_Id,
  CAST(B.customer_id AS STRING)                                   AS Customer_Number,
  CAST(B.txn_card_masked_number AS STRING)                        AS Credit_Card_Number,
  -- Real expiry exists in the table -> MMYY format like Sticky ('0629')
  CASE
    WHEN B.card_expiry_month IS NOT NULL AND B.card_expiry_year IS NOT NULL
    THEN CONCAT(
      LPAD(CAST(SAFE_CAST(B.card_expiry_month AS INT64) AS STRING), 2, '0'),
      SUBSTR(CAST(SAFE_CAST(B.card_expiry_year AS INT64) AS STRING), -2)
    )
  END                                                             AS Credit_Card_Expiration,
  CASE
    WHEN LOWER(CAST(B.card_funding_type AS STRING)) = 'prepaid' THEN 'Yes'
    WHEN B.card_funding_type IS NULL OR CAST(B.card_funding_type AS STRING) = '' THEN CAST(NULL AS STRING)
    ELSE 'No'   -- includes 'credit', 'debit', 'not_known'
  END                                                             AS Prepaid_Match,
  CAST(B.card_gateway_account_id AS STRING)                       AS Gateway_Id,
  CAST(B.card_gateway AS STRING)                                  AS Gateway_Descriptor,
  CAST(NULL AS STRING)                                            AS Processor_Id,
  CAST(B.ip_address AS STRING)                                    AS IP_Address,
  CAST(NULL AS STRING)                                            AS IP_Address_Lookup,

  ------------------------------------------------------------------
  -- 41-42: order status + decline reason
  -- Draft code mapping - CONFIRM before go-live
  ------------------------------------------------------------------
  CASE LOWER(CAST(B.invoice_status AS STRING))
    WHEN 'paid'        THEN 2   -- approved / complete
    WHEN 'posted'      THEN 2
    WHEN 'payment_due' THEN 6   -- pending / awaiting payment
    WHEN 'pending'     THEN 6
    WHEN 'not_paid'    THEN 7   -- failed / declined
    WHEN 'voided'      THEN 7
    ELSE SAFE_CAST(B.invoice_status AS INT64)
  END                                                             AS Final_Order_Status,
  CASE
    WHEN NULLIF(CAST(B.error_code AS STRING),'') IS NULL
     AND NULLIF(CAST(B.error_text AS STRING),'') IS NULL THEN CAST(NULL AS STRING)
    ELSE TRIM(CONCAT(
      IFNULL(NULLIF(CAST(B.error_code AS STRING),''), ''), ' - ',
      IFNULL(NULLIF(CAST(B.error_text AS STRING),''), '')
    ), ' -')
  END                                                             AS Decline_Reason,

  ------------------------------------------------------------------
  -- 43-63: flags, chargebacks, recurring, refunds
  ------------------------------------------------------------------
  CAST(NULL AS STRING)                                            AS Is_Cascaded,
  CAST(NULL AS STRING)                                            AS Is_Fraud,
  CASE WHEN LOWER(CAST(B.transaction_type AS STRING)) = 'chargeback' THEN '1' ELSE '0' END
                                                                  AS Is_Chargeback,
  CASE WHEN LOWER(CAST(B.transaction_type AS STRING)) = 'chargeback'
       THEN FORMAT_TIMESTAMP('%Y-%m-%d', B.transaction_ts) END    AS Chargeback_Date,
  CAST(NULL AS STRING)                                            AS Is_RMA,
  CAST(NULL AS STRING)                                            AS RMA_Number,
  CAST(NULL AS STRING)                                            AS RMA_Reason,
  CAST(NULL AS STRING)                                            AS Return_Reason,
  CASE
    WHEN LOWER(CAST(B.recurring AS STRING)) IN ('true','1')  THEN '1'
    WHEN LOWER(CAST(B.recurring AS STRING)) IN ('false','0') THEN '0'
    ELSE CAST(NULL AS STRING)
  END                                                             AS Is_Recurring,
  FORMAT_TIMESTAMP('%Y-%m-%d', B.next_billing_ts)                 AS Recurring_Date,
  FORMAT_TIMESTAMP('%Y-%m-%d', B.dunning_1_ts)                    AS Retry_Date,
  CAST(B.transaction_id AS STRING)                                AS Transaction_Number,
  CAST(NULL AS STRING)                                            AS Auth_Number,
  CAST(B.dunning_attempt_1_attempt AS STRING)                     AS Retry_Attempt,
  CAST(NULL AS STRING)                                            AS Hold_Date,
  CASE WHEN LOWER(CAST(B.transaction_type AS STRING)) = 'void' THEN 'yes' ELSE 'no' END
                                                                  AS Is_Void,
  CAST(NULL AS STRING)                                            AS Void_Amount,
  CAST(NULL AS STRING)                                            AS Void_Date,
  CASE WHEN SAFE_CAST(B.cn_total_amount_refunded AS FLOAT64) > 0 THEN 'yes' ELSE 'no' END
                                                                  AS Is_Refund,
  FORMAT('%.2f', COALESCE(B.refund_amt, 0))                       AS Refund_Amount,
  FORMAT_TIMESTAMP('%Y-%m-%d', B.cn_refunded_ts)                  AS Refund_Date,

  ------------------------------------------------------------------
  -- 64-71: tracking fields (coalesced across CB sources)
  ------------------------------------------------------------------
  CAST(B.afid_final AS STRING)                                    AS AFID,
  CAST(B.sid_final AS STRING)                                     AS SID,
  CAST(NULL AS STRING)                                            AS AFFID,   -- no source in Chargebee
  CAST(B.c1_final AS STRING)                                      AS C1,
  CAST(B.c2_final AS STRING)                                      AS C2,
  CAST(B.c3_final AS STRING)                                      AS C3,
  CAST(B.aid_final AS STRING)                                     AS AID,
  CAST(B.opt_final AS STRING)                                     AS OPT,

  ------------------------------------------------------------------
  -- 72-88: product / plan / entity
  ------------------------------------------------------------------
  FORMAT('%.2f', COALESCE(B.rebill_discount_amt, 0))              AS Rebill_Discount,
  CAST(B.billing_cycle_num AS STRING)                             AS Billing_Cycle,   -- derived: 0 = trial invoice, 1 = first rebill...
  CAST(NULL AS STRING)                                            AS Parent_Order_Id,
  CAST(B.product_id AS STRING)                                    AS Product_Id,
  CAST(B.product_name AS STRING)                                  AS Product_Name,
  FORMAT('%.2f', B.product_price_amt)                             AS Product_Price,
  CAST(B.plan_item_price_id AS STRING)                            AS Product_Sku,
  CAST(B.plan_quantity AS STRING)                                 AS Quantity,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', B.customer_created_ts)    AS Acquisition_Date_Time,
  CAST(NULL AS STRING)                                            AS Blacklisted,
  CAST(B.subscription_id AS STRING)                               AS Ancestor_Order_Id,
  CAST(NULL AS STRING)                                            AS Decline_Salvage_Discount_per,
  CAST(NULL AS STRING)                                            AS Test,
  CAST(NULL AS STRING)                                            AS Hold_Type,
  CAST(B.offer_id AS STRING)                                      AS Offer_Id,
  CAST(B.card_iin AS STRING)                                      AS BIN,
  B.Entity_Code                                                   AS Entity_Name,     -- 'PDF Dot Net LLC' -> 'PD'

  ------------------------------------------------------------------
  -- 89-99: derived country / campaign / currency columns
  ------------------------------------------------------------------
  CAST(NULL AS STRING)                                            AS last_1_word,
  CAST(NULL AS STRING)                                            AS last_2_words,
  CAST(NULL AS STRING)                                            AS last_3_words,
  CAST(NULL AS STRING)                                            AS IP_Country_Code,
  CAST(B.billing_country AS STRING)                               AS Bill_Country_Code,
  CAST(B.cust_country AS STRING)                                  AS Ship_Country_Code,
  CASE WHEN B.campaign_id_final IS NOT NULL
       THEN CONCAT(B.Entity_Code, '_', B.campaign_id_final) END   AS CAMPAIGN_KEY,
  B.App_Code                                                      AS App_Name,        -- 'pdf-net' -> 'PD'
  CAST(B.invoice_currency_code AS STRING)                         AS Currency,
  CAST(B.billing_country AS STRING)                               AS Country_Code,

  ------------------------------------------------------------------
  -- 100-102: AFID channel + updated IDs
  ------------------------------------------------------------------
  -- No 99 fallback: when the AFID has no match (or is empty), leave NULL
  AF.afid_channel                                                AS AFID_CHANNEL,
  CONCAT(B.Entity_Code, '_', CAST(B.customer_id AS STRING),
         FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', B.customer_created_ts))
                                                                  AS Updated_Cust_ID,
  CONCAT(B.Entity_Code, '_', CAST(B.invoice_id AS STRING))        AS Updated_Order_ID,

  ------------------------------------------------------------------
  -- 103-113: spend / tax country, trial, product final, billing cycle updated
  ------------------------------------------------------------------
  CAST(B.billing_country AS STRING)                               AS Spend_Country,
  CAST(B.tax_origin_country AS STRING)                            AS Tax_Country,
  OFR.Trial_Period                                                                AS Trial_Period,
  OFR.Trial_Price                                                                 AS Trial_Price,
  OFR.Trial_Type                                                                  AS Trial_Type,
  PRD.Product_Name_updated                                                        AS Product_Name_updated,
  -- Sticky rule: CONCAT(App_Name, Product_Name_updated, Trial_Type)
  CONCAT(
    B.App_Code,
    PRD.Product_Name_updated,
    OFR.Trial_Type
  )                                                               AS Product_Name_Final,
  -- Same rule as Sticky: no-trial (NT) plans get +1 on the cycle number
  CASE
    WHEN OFR.Trial_Type = 'NT' THEN B.billing_cycle_num + 1
    ELSE B.billing_cycle_num
  END                                                             AS Billing_Cycle_Updated,
  CAST(B.billing_country AS STRING)                               AS Spend_Country_Code,
  CAST(B.tax_origin_country AS STRING)                            AS Tax_Country_Code,

  ------------------------------------------------------------------
  -- 114-124: exchange rate, tax rate, money columns (native + USD)
  ------------------------------------------------------------------
  B.fx_rate                                                       AS Exchange_Rate,

  -- Computed: effective tax rate backed out of the tax amount
  -- (line_tax_1_tax_rate is null in the data). US = 0, like Sticky.
  CASE
    WHEN UPPER(B.billing_country) = 'US' THEN 0
    ELSE COALESCE(
      SAFE_DIVIDE(B.tax_amt, SAFE_SUBTRACT(B.invoice_total_amt, B.tax_amt)), 0)
  END                                                             AS Sales_Tax_Rate_Non_US,

  SAFE_MULTIPLY(B.plan_unit_price_amt, SAFE_CAST(B.plan_quantity AS FLOAT64))
                                                                  AS Plan_Price_Native_Currency,
  B.invoice_total_amt                                             AS Order_Total_Native_Currency,
  COALESCE(B.tax_amt, 0)                                          AS Sales_Tax_Amount_Native_Currency,
  SAFE_SUBTRACT(B.invoice_total_amt, COALESCE(B.tax_amt, 0))      AS Order_Price_Net_of_Tax_Native_Currency,
  SAFE_MULTIPLY(B.plan_unit_price_amt, SAFE_CAST(B.plan_quantity AS FLOAT64))
                                                                  AS Plan_Price_Net_of_Tax_Native_Currency,  -- per mapping (tax rate null)

  SAFE_MULTIPLY(
    SAFE_MULTIPLY(B.plan_unit_price_amt, SAFE_CAST(B.plan_quantity AS FLOAT64)),
    B.fx_rate)                                                    AS Plan_Price_USD,
  SAFE_MULTIPLY(B.invoice_total_amt, B.fx_rate)                   AS Order_Total_USD,
  SAFE_MULTIPLY(COALESCE(B.tax_amt, 0), B.fx_rate)                AS Sales_Tax_Amount_USD,
  SAFE_MULTIPLY(
    SAFE_SUBTRACT(B.invoice_total_amt, COALESCE(B.tax_amt, 0)),
    B.fx_rate)                                                    AS Order_Price_Net_of_Tax_USD,
  SAFE_MULTIPLY(
    SAFE_MULTIPLY(B.plan_unit_price_amt, SAFE_CAST(B.plan_quantity AS FLOAT64)),
    B.fx_rate)                                                    AS Plan_Price_Net_of_Tax_USD,
  SAFE_MULTIPLY(COALESCE(B.refund_amt, 0), B.fx_rate)             AS Refund_Amount_USD

FROM Base B

-- AFID -> channel lookup, now on Chargebee's own dim table (a copy of the
-- Sticky one, maintained separately). No 99 fallback: null when no match.
LEFT JOIN `variant-finance-data-project.chargebee.Chargebee_Dim_AFID` AF
  ON B.afid_final = AF.AFID

-- Offer mapping sheet: offer_id -> Trial_Type / Trial_Period / Trial_Price.
-- This is the Chargebee equivalent of Sticky_Dim_Offer. Maintain it by hand
-- (Google Sheet synced to BigQuery), one row per offer_id.
-- If an offer is missing here, Trial_Type falls back to the computed guess.
LEFT JOIN `variant-finance-data-project.chargebee.Chargebee_Dim_Offer` OFR
  ON CONCAT('PD_', CAST(B.product_id AS STRING)) = CONCAT(OFR.Entity, '_', CAST(OFR.ID AS STRING))
  AND (OFR.Currency IS NULL OR OFR.Currency = '' OR OFR.Currency = CAST(B.invoice_currency_code AS STRING))

-- Product mapping sheet: product_id -> Product_Name_updated.
-- Chargebee equivalent of Sticky_Dim_Product. If missing, falls back to
-- the raw product_name.
LEFT JOIN `variant-finance-data-project.chargebee.Chargebee_Dim_Product` PRD
  ON CONCAT('PD_', CAST(B.product_id AS STRING)) = CONCAT(PRD.Entity, '_', CAST(PRD.Product_Id AS STRING))
  AND (PRD.Currency IS NULL OR PRD.Currency = '' OR PRD.Currency = CAST(B.invoice_currency_code AS STRING));
