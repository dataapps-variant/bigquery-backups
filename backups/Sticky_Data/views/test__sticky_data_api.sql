CREATE VIEW `variant-finance-data-project.Sticky_Data.test__sticky_data_api`
AS WITH unioned AS (

  SELECT
    _airbyte_raw_id,
    _airbyte_extracted_at,
    _airbyte_meta,
    _airbyte_generation_id,
    c1,
    c2,
    c3,
    aid,
    opt,
    sid,
    afid,
    affid,
    is_rma,
    source as sources,
    auth_id,
    cc_type,
    is_void,
    on_hold,
    prd_sku,
    child_id,
    click_id,
    is_fraud,
    order_id,
    prd_name,
    affiliate,
    cc_last_4,
    cc_number,
    coupon_id,
    hold_date,
    is_refund,
    last_name,
    parent_id,
    prd_price,
    shippable,
    void_date,
    cc_expires,
    cc_first_6,
    contact_id,
    first_name,
    gateway_id,
    ip_address,
    is_test_cc,
    on_hold_by,
    promo_code,
    retry_date,
    rma_number,
    rma_reason,
    time_stamp,
    ancestor_id,
    campaign_id,
    customer_id,
    is_cascaded,
    order_total,
    prd_on_hold,
    refund_date,
    shipping_id,
    systemNotes,
    void_amount,
    billing_city,
    is_recurring,
    order_status,
    prd_offer_id,
    processor_id,
    website_sent,
    billing_cycle,
    billing_state,
    breakdown_tax,
    email_address,
    employeeNotes,
    is_chargeback,
    prd_hold_date,
    prd_hold_type,
    prd_is_add_on,
    prepaid_match,
    refund_amount,
    response_code,
    retry_attempt,
    return_reason,
    shipping_city,
    shipping_date,
    sub_affiliate,
    cc_orig_last_4,
    credit_applied,
    decline_reason,
    is_blacklisted,
    prd_offer_name,
    prd_product_id,
    recurring_date,
    shipping_state,
    transaction_id,
    billing_country,
    breakdown_total,
    cc_orig_first_6,
    chargeback_date,
    is_3d_protected,
    main_product_id,
    order_confirmed,
    order_sales_tax,
    prd_is_in_trial,
    prd_is_terminal,
    prd_product_qty,
    prd_step_number,
    shipping_amount,
    tracking_number,
    acquisition_date,
    billing_postcode,
    billing_state_id,
    check_ssn_last_4,
    check_transitnum,
    consent_received,
    consent_required,
    prd_is_recurring,
    prd_is_shippable,
    preserve_gateway,
    shipping_country,
    website_received,
    billing_last_name,
    breakdown_tax_pct,
    breakdown_vat_tax,
    ip_Address_lookup,
    prd_refund_amount,
    shipping_postcode,
    shipping_state_id,
    upsell_product_id,
    billing_first_name,
    breakdown_refunded,
    breakdown_shipping,
    breakdown_subtotal,
    credit_card_number,
    gateway_descriptor,
    prd_is_full_refund,
    prd_recurring_date,
    shipping_last_name,
    customers_telephone,
    prd_subscription_id,
    shipping_first_name,
    billing_company_name,
    check_account_last_4,
    check_routing_last_4,
    created_by_user_name,
    order_confirmed_date,
    prd_billing_model_id,
    shipping_method_name,
    breakdown_vat_tax_pct,
    main_product_quantity,
    prd_subscription_desc,
    prd_subscription_type,
    shipping_company_name,
    billing_street_address,
    coupon_discount_amount,
    decline_reason_details,
    order_sales_tax_amount,
    prd_billing_model_name,
    prd_forecasted_revenue,
    stop_after_next_rebill,
    amount_refunded_to_date,
    billing_street_address2,
    rebill_discount_percent,
    shipping_street_address,
    upsell_product_quantity,
    breakdown_restocking_fee,
    created_by_employee_name,
    is_any_product_recurring,
    shipping_street_address2,
    breakdown_amount_refunded,
    breakdown_volume_discount,
    next_subscription_product,
    prd_next_subscription_qty,
    prd_billing_model_discount,
    next_subscription_product_id,
    prd_billing_model_description,
    prd_next_subscription_product,
    current_rebill_discount_percent,
    decline_salvage_discount_percent,
    prd_next_subscription_product_id,
    prd_next_subscription_product_price,
    custom_fields
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT_1`

  UNION ALL

  SELECT
    _airbyte_raw_id,
    _airbyte_extracted_at,
    _airbyte_meta,
    _airbyte_generation_id,
    c1,
    c2,
    c3,
    aid,
    opt,
    sid,
    afid,
    affid,
    is_rma,
    source,
    auth_id,
    cc_type,
    is_void,
    on_hold,
    prd_sku,
    child_id,
    click_id,
    is_fraud,
    order_id,
    prd_name,
    affiliate,
    cc_last_4,
    cc_number,
    coupon_id,
    hold_date,
    is_refund,
    last_name,
    parent_id,
    prd_price,
    shippable,
    void_date,
    cc_expires,
    cc_first_6,
    contact_id,
    first_name,
    gateway_id,
    ip_address,
    is_test_cc,
    on_hold_by,
    promo_code,
    retry_date,
    rma_number,
    rma_reason,
    time_stamp,
    ancestor_id,
    campaign_id,
    customer_id,
    is_cascaded,
    order_total,
    prd_on_hold,
    refund_date,
    shipping_id,
    systemNotes,
    void_amount,
    billing_city,
    is_recurring,
    order_status,
    prd_offer_id,
    processor_id,
    website_sent,
    billing_cycle,
    billing_state,
    breakdown_tax,
    email_address,
    employeeNotes,
    is_chargeback,
    prd_hold_date,
    prd_hold_type,
    prd_is_add_on,
    prepaid_match,
    refund_amount,
    response_code,
    retry_attempt,
    return_reason,
    shipping_city,
    shipping_date,
    sub_affiliate,
    cc_orig_last_4,
    credit_applied,
    decline_reason,
    is_blacklisted,
    prd_offer_name,
    prd_product_id,
    recurring_date,
    shipping_state,
    transaction_id,
    billing_country,
    breakdown_total,
    cc_orig_first_6,
    chargeback_date,
    is_3d_protected,
    main_product_id,
    order_confirmed,
    order_sales_tax,
    prd_is_in_trial,
    prd_is_terminal,
    prd_product_qty,
    prd_step_number,
    shipping_amount,
    tracking_number,
    acquisition_date,
    billing_postcode,
    billing_state_id,
    check_ssn_last_4,
    check_transitnum,
    consent_received,
    consent_required,
    prd_is_recurring,
    prd_is_shippable,
    preserve_gateway,
    shipping_country,
    website_received,
    billing_last_name,
    breakdown_tax_pct,
    breakdown_vat_tax,
    ip_Address_lookup,
    prd_refund_amount,
    shipping_postcode,
    shipping_state_id,
    upsell_product_id,
    billing_first_name,
    breakdown_refunded,
    breakdown_shipping,
    breakdown_subtotal,
    credit_card_number,
    gateway_descriptor,
    prd_is_full_refund,
    prd_recurring_date,
    shipping_last_name,
    customers_telephone,
    prd_subscription_id,
    shipping_first_name,
    billing_company_name,
    check_account_last_4,
    check_routing_last_4,
    created_by_user_name,
    order_confirmed_date,
    prd_billing_model_id,
    shipping_method_name,
    breakdown_vat_tax_pct,
    main_product_quantity,
    prd_subscription_desc,
    prd_subscription_type,
    shipping_company_name,
    billing_street_address,
    coupon_discount_amount,
    decline_reason_details,
    order_sales_tax_amount,
    prd_billing_model_name,
    prd_forecasted_revenue,
    stop_after_next_rebill,
    amount_refunded_to_date,
    billing_street_address2,
    rebill_discount_percent,
    shipping_street_address,
    upsell_product_quantity,
    breakdown_restocking_fee,
    created_by_employee_name,
    is_any_product_recurring,
    shipping_street_address2,
    breakdown_amount_refunded,
    breakdown_volume_discount,
    next_subscription_product,
    prd_next_subscription_qty,
    prd_billing_model_discount,
    next_subscription_product_id,
    prd_billing_model_description,
    prd_next_subscription_product,
    current_rebill_discount_percent,
    decline_salvage_discount_percent,
    prd_next_subscription_product_id,
    prd_next_subscription_product_price,
    CAST(NULL AS JSON) AS custom_fields
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT_2`

  UNION ALL

  SELECT
    _airbyte_raw_id,
    _airbyte_extracted_at,
    _airbyte_meta,
    _airbyte_generation_id,
    c1,
    c2,
    c3,
    aid,
    opt,
    sid,
    afid,
    affid,
    is_rma,
    source,
    auth_id,
    cc_type,
    is_void,
    on_hold,
    prd_sku,
    child_id,
    click_id,
    is_fraud,
    order_id,
    prd_name,
    affiliate,
    cc_last_4,
    cc_number,
    coupon_id,
    hold_date,
    is_refund,
    last_name,
    parent_id,
    prd_price,
    shippable,
    void_date,
    cc_expires,
    cc_first_6,
    contact_id,
    first_name,
    gateway_id,
    ip_address,
    is_test_cc,
    on_hold_by,
    promo_code,
    retry_date,
    rma_number,
    rma_reason,
    time_stamp,
    ancestor_id,
    campaign_id,
    customer_id,
    is_cascaded,
    order_total,
    prd_on_hold,
    refund_date,
    shipping_id,
    systemNotes,
    void_amount,
    billing_city,
    is_recurring,
    order_status,
    prd_offer_id,
    processor_id,
    website_sent,
    billing_cycle,
    billing_state,
    breakdown_tax,
    email_address,
    employeeNotes,
    is_chargeback,
    prd_hold_date,
    prd_hold_type,
    prd_is_add_on,
    prepaid_match,
    refund_amount,
    response_code,
    retry_attempt,
    return_reason,
    shipping_city,
    shipping_date,
    sub_affiliate,
    cc_orig_last_4,
    credit_applied,
    decline_reason,
    is_blacklisted,
    prd_offer_name,
    prd_product_id,
    recurring_date,
    shipping_state,
    transaction_id,
    billing_country,
    breakdown_total,
    cc_orig_first_6,
    chargeback_date,
    is_3d_protected,
    main_product_id,
    order_confirmed,
    order_sales_tax,
    prd_is_in_trial,
    prd_is_terminal,
    prd_product_qty,
    prd_step_number,
    shipping_amount,
    tracking_number,
    acquisition_date,
    billing_postcode,
    billing_state_id,
    check_ssn_last_4,
    check_transitnum,
    consent_received,
    consent_required,
    prd_is_recurring,
    prd_is_shippable,
    preserve_gateway,
    shipping_country,
    website_received,
    billing_last_name,
    breakdown_tax_pct,
    breakdown_vat_tax,
    ip_Address_lookup,
    prd_refund_amount,
    shipping_postcode,
    shipping_state_id,
    upsell_product_id,
    billing_first_name,
    breakdown_refunded,
    breakdown_shipping,
    breakdown_subtotal,
    credit_card_number,
    gateway_descriptor,
    prd_is_full_refund,
    prd_recurring_date,
    shipping_last_name,
    customers_telephone,
    prd_subscription_id,
    shipping_first_name,
    billing_company_name,
    check_account_last_4,
    check_routing_last_4,
    created_by_user_name,
    order_confirmed_date,
    prd_billing_model_id,
    shipping_method_name,
    breakdown_vat_tax_pct,
    main_product_quantity,
    prd_subscription_desc,
    prd_subscription_type,
    shipping_company_name,
    billing_street_address,
    coupon_discount_amount,
    decline_reason_details,
    order_sales_tax_amount,
    prd_billing_model_name,
    prd_forecasted_revenue,
    stop_after_next_rebill,
    amount_refunded_to_date,
    billing_street_address2,
    rebill_discount_percent,
    shipping_street_address,
    upsell_product_quantity,
    breakdown_restocking_fee,
    created_by_employee_name,
    is_any_product_recurring,
    shipping_street_address2,
    breakdown_amount_refunded,
    breakdown_volume_discount,
    next_subscription_product,
    prd_next_subscription_qty,
    prd_billing_model_discount,
    next_subscription_product_id,
    prd_billing_model_description,
    prd_next_subscription_product,
    current_rebill_discount_percent,
    decline_salvage_discount_percent,
    prd_next_subscription_product_id,
    prd_next_subscription_product_price,
    CAST(NULL AS JSON) AS custom_fields
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT_3`

  UNION ALL

  SELECT
    _airbyte_raw_id,
    _airbyte_extracted_at,
    _airbyte_meta,
    _airbyte_generation_id,
    c1,
    c2,
    c3,
    aid,
    opt,
    sid,
    afid,
    affid,
    is_rma,
    source,
    auth_id,
    cc_type,
    is_void,
    on_hold,
    prd_sku,
    child_id,
    click_id,
    is_fraud,
    order_id,
    prd_name,
    affiliate,
    cc_last_4,
    cc_number,
    coupon_id,
    hold_date,
    is_refund,
    last_name,
    parent_id,
    prd_price,
    shippable,
    void_date,
    cc_expires,
    cc_first_6,
    contact_id,
    first_name,
    gateway_id,
    ip_address,
    is_test_cc,
    on_hold_by,
    promo_code,
    retry_date,
    rma_number,
    rma_reason,
    time_stamp,
    ancestor_id,
    campaign_id,
    customer_id,
    is_cascaded,
    order_total,
    prd_on_hold,
    refund_date,
    shipping_id,
    systemNotes,
    void_amount,
    billing_city,
    is_recurring,
    order_status,
    prd_offer_id,
    processor_id,
    website_sent,
    billing_cycle,
    billing_state,
    breakdown_tax,
    email_address,
    employeeNotes,
    is_chargeback,
    prd_hold_date,
    prd_hold_type,
    prd_is_add_on,
    prepaid_match,
    refund_amount,
    response_code,
    retry_attempt,
    return_reason,
    shipping_city,
    shipping_date,
    sub_affiliate,
    cc_orig_last_4,
    credit_applied,
    decline_reason,
    is_blacklisted,
    prd_offer_name,
    prd_product_id,
    recurring_date,
    shipping_state,
    transaction_id,
    billing_country,
    breakdown_total,
    cc_orig_first_6,
    chargeback_date,
    is_3d_protected,
    main_product_id,
    order_confirmed,
    order_sales_tax,
    prd_is_in_trial,
    prd_is_terminal,
    prd_product_qty,
    prd_step_number,
    shipping_amount,
    tracking_number,
    acquisition_date,
    billing_postcode,
    billing_state_id,
    check_ssn_last_4,
    check_transitnum,
    consent_received,
    consent_required,
    prd_is_recurring,
    prd_is_shippable,
    preserve_gateway,
    shipping_country,
    website_received,
    billing_last_name,
    breakdown_tax_pct,
    breakdown_vat_tax,
    ip_Address_lookup,
    prd_refund_amount,
    shipping_postcode,
    shipping_state_id,
    upsell_product_id,
    billing_first_name,
    breakdown_refunded,
    breakdown_shipping,
    breakdown_subtotal,
    credit_card_number,
    gateway_descriptor,
    prd_is_full_refund,
    prd_recurring_date,
    shipping_last_name,
    customers_telephone,
    prd_subscription_id,
    shipping_first_name,
    billing_company_name,
    check_account_last_4,
    check_routing_last_4,
    created_by_user_name,
    order_confirmed_date,
    prd_billing_model_id,
    shipping_method_name,
    breakdown_vat_tax_pct,
    main_product_quantity,
    prd_subscription_desc,
    prd_subscription_type,
    shipping_company_name,
    billing_street_address,
    coupon_discount_amount,
    decline_reason_details,
    order_sales_tax_amount,
    prd_billing_model_name,
    prd_forecasted_revenue,
    stop_after_next_rebill,
    amount_refunded_to_date,
    billing_street_address2,
    rebill_discount_percent,
    shipping_street_address,
    upsell_product_quantity,
    breakdown_restocking_fee,
    created_by_employee_name,
    is_any_product_recurring,
    shipping_street_address2,
    breakdown_amount_refunded,
    breakdown_volume_discount,
    next_subscription_product,
    prd_next_subscription_qty,
    prd_billing_model_discount,
    next_subscription_product_id,
    prd_billing_model_description,
    prd_next_subscription_product,
    current_rebill_discount_percent,
    decline_salvage_discount_percent,
    prd_next_subscription_product_id,
    prd_next_subscription_product_price,
    CAST(NULL AS JSON) AS custom_fields
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT_4`

  UNION ALL

  SELECT
    _airbyte_raw_id,
    _airbyte_extracted_at,
    _airbyte_meta,
    _airbyte_generation_id,
    c1,
    c2,
    c3,
    aid,
    opt,
    sid,
    afid,
    affid,
    is_rma,
    source,
    auth_id,
    cc_type,
    is_void,
    on_hold,
    prd_sku,
    child_id,
    click_id,
    is_fraud,
    order_id,
    prd_name,
    affiliate,
    cc_last_4,
    cc_number,
    coupon_id,
    hold_date,
    is_refund,
    last_name,
    parent_id,
    prd_price,
    shippable,
    void_date,
    cc_expires,
    cc_first_6,
    contact_id,
    first_name,
    gateway_id,
    ip_address,
    is_test_cc,
    on_hold_by,
    promo_code,
    retry_date,
    rma_number,
    rma_reason,
    time_stamp,
    ancestor_id,
    campaign_id,
    customer_id,
    is_cascaded,
    order_total,
    prd_on_hold,
    refund_date,
    shipping_id,
    systemNotes,
    void_amount,
    billing_city,
    is_recurring,
    order_status,
    prd_offer_id,
    processor_id,
    website_sent,
    billing_cycle,
    billing_state,
    breakdown_tax,
    email_address,
    employeeNotes,
    is_chargeback,
    prd_hold_date,
    prd_hold_type,
    prd_is_add_on,
    prepaid_match,
    refund_amount,
    response_code,
    retry_attempt,
    return_reason,
    shipping_city,
    shipping_date,
    sub_affiliate,
    cc_orig_last_4,
    credit_applied,
    decline_reason,
    is_blacklisted,
    prd_offer_name,
    prd_product_id,
    recurring_date,
    shipping_state,
    transaction_id,
    billing_country,
    breakdown_total,
    cc_orig_first_6,
    chargeback_date,
    is_3d_protected,
    main_product_id,
    order_confirmed,
    order_sales_tax,
    prd_is_in_trial,
    prd_is_terminal,
    prd_product_qty,
    prd_step_number,
    shipping_amount,
    tracking_number,
    acquisition_date,
    billing_postcode,
    billing_state_id,
    check_ssn_last_4,
    check_transitnum,
    consent_received,
    consent_required,
    prd_is_recurring,
    prd_is_shippable,
    preserve_gateway,
    shipping_country,
    website_received,
    billing_last_name,
    breakdown_tax_pct,
    breakdown_vat_tax,
    ip_Address_lookup,
    prd_refund_amount,
    shipping_postcode,
    shipping_state_id,
    upsell_product_id,
    billing_first_name,
    breakdown_refunded,
    breakdown_shipping,
    breakdown_subtotal,
    credit_card_number,
    gateway_descriptor,
    prd_is_full_refund,
    prd_recurring_date,
    shipping_last_name,
    customers_telephone,
    prd_subscription_id,
    shipping_first_name,
    billing_company_name,
    check_account_last_4,
    check_routing_last_4,
    created_by_user_name,
    order_confirmed_date,
    prd_billing_model_id,
    shipping_method_name,
    breakdown_vat_tax_pct,
    main_product_quantity,
    prd_subscription_desc,
    prd_subscription_type,
    shipping_company_name,
    billing_street_address,
    coupon_discount_amount,
    decline_reason_details,
    order_sales_tax_amount,
    prd_billing_model_name,
    prd_forecasted_revenue,
    stop_after_next_rebill,
    amount_refunded_to_date,
    billing_street_address2,
    rebill_discount_percent,
    shipping_street_address,
    upsell_product_quantity,
    breakdown_restocking_fee,
    created_by_employee_name,
    is_any_product_recurring,
    shipping_street_address2,
    breakdown_amount_refunded,
    breakdown_volume_discount,
    next_subscription_product,
    prd_next_subscription_qty,
    prd_billing_model_discount,
    next_subscription_product_id,
    prd_billing_model_description,
    prd_next_subscription_product,
    current_rebill_discount_percent,
    decline_salvage_discount_percent,
    prd_next_subscription_product_id,
    prd_next_subscription_product_price,
    CAST(NULL AS JSON) AS custom_fields
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT_5`

  UNION ALL

  SELECT
    _airbyte_raw_id,
    _airbyte_extracted_at,
    _airbyte_meta,
    _airbyte_generation_id,
    c1,
    c2,
    c3,
    aid,
    opt,
    sid,
    afid,
    affid,
    is_rma,
    source,
    auth_id,
    cc_type,
    is_void,
    on_hold,
    prd_sku,
    child_id,
    click_id,
    is_fraud,
    order_id,
    prd_name,
    affiliate,
    cc_last_4,
    cc_number,
    coupon_id,
    hold_date,
    is_refund,
    last_name,
    parent_id,
    prd_price,
    shippable,
    void_date,
    cc_expires,
    cc_first_6,
    contact_id,
    first_name,
    gateway_id,
    ip_address,
    is_test_cc,
    on_hold_by,
    promo_code,
    retry_date,
    rma_number,
    rma_reason,
    time_stamp,
    ancestor_id,
    campaign_id,
    customer_id,
    is_cascaded,
    order_total,
    prd_on_hold,
    refund_date,
    shipping_id,
    systemNotes,
    void_amount,
    billing_city,
    is_recurring,
    order_status,
    prd_offer_id,
    processor_id,
    website_sent,
    billing_cycle,
    billing_state,
    breakdown_tax,
    email_address,
    employeeNotes,
    is_chargeback,
    prd_hold_date,
    prd_hold_type,
    prd_is_add_on,
    prepaid_match,
    refund_amount,
    response_code,
    retry_attempt,
    return_reason,
    shipping_city,
    shipping_date,
    sub_affiliate,
    cc_orig_last_4,
    credit_applied,
    decline_reason,
    is_blacklisted,
    prd_offer_name,
    prd_product_id,
    recurring_date,
    shipping_state,
    transaction_id,
    billing_country,
    breakdown_total,
    cc_orig_first_6,
    chargeback_date,
    is_3d_protected,
    main_product_id,
    order_confirmed,
    order_sales_tax,
    prd_is_in_trial,
    prd_is_terminal,
    prd_product_qty,
    prd_step_number,
    shipping_amount,
    tracking_number,
    acquisition_date,
    billing_postcode,
    billing_state_id,
    check_ssn_last_4,
    check_transitnum,
    consent_received,
    consent_required,
    prd_is_recurring,
    prd_is_shippable,
    preserve_gateway,
    shipping_country,
    website_received,
    billing_last_name,
    breakdown_tax_pct,
    breakdown_vat_tax,
    ip_Address_lookup,
    prd_refund_amount,
    shipping_postcode,
    shipping_state_id,
    upsell_product_id,
    billing_first_name,
    breakdown_refunded,
    breakdown_shipping,
    breakdown_subtotal,
    credit_card_number,
    gateway_descriptor,
    prd_is_full_refund,
    prd_recurring_date,
    shipping_last_name,
    customers_telephone,
    prd_subscription_id,
    shipping_first_name,
    billing_company_name,
    check_account_last_4,
    check_routing_last_4,
    created_by_user_name,
    order_confirmed_date,
    prd_billing_model_id,
    shipping_method_name,
    breakdown_vat_tax_pct,
    main_product_quantity,
    prd_subscription_desc,
    prd_subscription_type,
    shipping_company_name,
    billing_street_address,
    coupon_discount_amount,
    decline_reason_details,
    order_sales_tax_amount,
    prd_billing_model_name,
    prd_forecasted_revenue,
    stop_after_next_rebill,
    amount_refunded_to_date,
    billing_street_address2,
    rebill_discount_percent,
    shipping_street_address,
    upsell_product_quantity,
    breakdown_restocking_fee,
    created_by_employee_name,
    is_any_product_recurring,
    shipping_street_address2,
    breakdown_amount_refunded,
    breakdown_volume_discount,
    next_subscription_product,
    prd_next_subscription_qty,
    prd_billing_model_discount,
    next_subscription_product_id,
    prd_billing_model_description,
    prd_next_subscription_product,
    current_rebill_discount_percent,
    decline_salvage_discount_percent,
    prd_next_subscription_product_id,
    prd_next_subscription_product_price,
    custom_fields
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT_Incremental`

)
select * from unioned;
