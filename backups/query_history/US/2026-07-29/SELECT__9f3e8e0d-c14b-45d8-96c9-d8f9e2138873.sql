-- job_id: 9f3e8e0d-c14b-45d8-96c9-d8f9e2138873
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T12:00:32.486000+00:00
-- started: 2026-07-29T12:00:32.583000+00:00
-- ended: 2026-07-29T12:00:32.794000+00:00

SELECT MAX(Report_date) max_row,
  MAX(IF(Net_LTV_Discounted IS NOT NULL, Report_date, NULL)) max_ltv,
  MAX(IF(Net_ARPU_Discounted IS NOT NULL, Report_date, NULL)) max_arpu,
  COUNTIF(Report_date='2026-07-29' AND Net_LTV_Discounted IS NOT NULL) nonnull_on_0729
 FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball`
