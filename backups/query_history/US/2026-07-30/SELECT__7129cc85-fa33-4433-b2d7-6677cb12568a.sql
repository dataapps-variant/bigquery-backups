-- job_id: 7129cc85-fa33-4433-b2d7-6677cb12568a
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:43:09.504000+00:00
-- started: 2026-07-30T12:43:09.675000+00:00
-- ended: 2026-07-30T12:43:10.603000+00:00


SELECT COUNT(*) afids, COUNTIF(n_cty>1) ambiguous FROM (
 SELECT afid, COUNT(DISTINCT spend_country_code_afid) n_cty
 FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Table` GROUP BY 1)
