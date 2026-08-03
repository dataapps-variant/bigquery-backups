-- job_id: script_job_c483b517b697f5f7d50ac9000db09065_1
-- user: dataapps@variant.net
-- statement_type: CREATE_VIEW
-- created: 2026-08-03T08:33:39.691000+00:00
-- started: 2026-08-03T08:33:39.902000+00:00
-- ended: 2026-08-03T08:33:40.025000+00:00

CREATE OR REPLACE VIEW `variant-finance-data-project.Cohort_Hunter.v_arpu_training` AS
SELECT
  entity_name,
  app_name,
  product_name_final_merged,
  trial_type,
  is_nt,
  CAST(afid_channel AS STRING)  AS afid_channel,
  spend_country_code_afid,
  payment,
  gateway_id,
  dow_bc0,
  CAST(month_bc0 AS STRING)     AS month_bc0,
  retry_bc0,
  acquisition_date,

  -- label: the REVENUE side only. CAC is not predicted -- it is known.
  cum_net_arpu_thru_bc4

FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Wide`
WHERE is_bc4_mature = TRUE
  AND NOT is_organic
  AND bc4_net_ltv IS NOT NULL
  AND cac IS NOT NULL
  AND acquisition_date IS NOT NULL
  AND acquisition_date >= '2024-01-01'
