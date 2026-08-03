-- job_id: script_job_2b8a81e23b6256afadcb99737cc0b1be_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:22:52.447000+00:00
-- started: 2026-07-31T09:22:52.529000+00:00
-- ended: 2026-07-31T09:22:54.259000+00:00

SELECT
  COUNT(*)                                    AS total_rows,
  COUNTIF(is_bc4_mature)                      AS mature_rows,
  COUNTIF(is_bc4_mature
          AND NOT is_organic
          AND bc4_net_ltv IS NOT NULL)        AS trainable_rows,
  MIN(acquisition_date)                       AS earliest_acq,
  MAX(acquisition_date)                       AS latest_acq,
  COUNTIF(acquisition_date IS NULL)           AS null_acq_dates
FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Wide`
