-- job_id: script_job_d347cbf8607dde6e66fa296d710f85df_6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:23:06.453000+00:00
-- started: 2026-07-31T09:23:06.537000+00:00
-- ended: 2026-07-31T09:23:08.227000+00:00

SELECT
  COUNT(DISTINCT entity_name)               AS n_entity,
  COUNT(DISTINCT app_name)                  AS n_app,
  COUNT(DISTINCT product_name_final_merged) AS n_product,
  COUNT(DISTINCT trial_type)                AS n_trial_type,
  COUNT(DISTINCT afid_channel)              AS n_afid_channel,
  COUNT(DISTINCT spend_country_code_afid)   AS n_country,
  COUNT(DISTINCT payment)                   AS n_payment,
  COUNT(DISTINCT gateway_id)                AS n_gateway,
  COUNT(DISTINCT dow_bc0)                   AS n_dow,
  COUNT(DISTINCT bin)                       AS n_bin,
  COUNT(DISTINCT afid)                      AS n_afid,
  COUNT(DISTINCT campaign_id)               AS n_campaign
FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Wide`
WHERE is_bc4_mature = TRUE
  AND NOT is_organic
