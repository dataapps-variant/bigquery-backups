-- job_id: script_job_7c90df0d083d3dc00c39999100a2c925_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:11:30.236000+00:00
-- started: 2026-07-31T09:11:30.334000+00:00
-- ended: 2026-07-31T09:11:30.372000+00:00

SELECT
  COUNT(*)                                    AS total_rows,
  COUNTIF(is_bc4_mature)                      AS mature_rows,
  COUNTIF(is_bc4_mature
          AND NOT is_organic
          AND bc4_net_ltv IS NOT NULL)        AS trainable_rows,
  MIN(Date_of_Sale)                           AS earliest_acq,   -- <<< EDIT
  MAX(Date_of_Sale)                           AS latest_acq,     -- <<< EDIT
  COUNT(DISTINCT afid_channel)                AS n_channels,
  COUNT(DISTINCT gateway_id)                  AS n_gateways,
  COUNT(DISTINCT product_name_final_merged)   AS n_products,
  COUNT(DISTINCT entity_name)                 AS n_entities
FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Wide`
