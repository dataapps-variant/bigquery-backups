CREATE VIEW `variant-finance-data-project.Cohort_Hunter.v_ltv_predictions_by_cohort`
AS SELECT
  prediction_date,
  model_version,
  entity_name,
  app_name,
  product_name_final_merged,
  trial_type,
  afid_channel,
  spend_country_code_afid,
  payment,
  gateway_id,

  COUNT(*)                                          AS subs,
  ROUND(AVG(predicted_bc4_net_ltv), 2)              AS avg_predicted_ltv,
  ROUND(SUM(predicted_bc4_net_ltv), 0)              AS total_predicted_ltv,
  ROUND(SUM(cac), 0)                                AS total_cac,
  ROUND(AVG(cac), 2)                                AS avg_cac,

  ROUND(100 * COUNTIF(predicted_bc4_net_ltv < 0) / COUNT(*), 1)
                                                    AS pct_predicted_unprofitable,

  -- spread, so a confident cohort can be told apart from a mixed one
  ROUND(APPROX_QUANTILES(predicted_bc4_net_ltv, 100)[OFFSET(25)], 2) AS p25,
  ROUND(APPROX_QUANTILES(predicted_bc4_net_ltv, 100)[OFFSET(50)], 2) AS median,
  ROUND(APPROX_QUANTILES(predicted_bc4_net_ltv, 100)[OFFSET(75)], 2) AS p75,

  MIN(acquisition_date)                             AS earliest_acq,
  MAX(acquisition_date)                             AS latest_acq
FROM `variant-finance-data-project.Cohort_Hunter.ltv_bc4_predictions`
GROUP BY 1,2,3,4,5,6,7,8,9,10;
