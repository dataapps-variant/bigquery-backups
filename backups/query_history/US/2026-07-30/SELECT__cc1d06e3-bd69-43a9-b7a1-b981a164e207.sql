-- job_id: cc1d06e3-bd69-43a9-b7a1-b981a164e207
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:43:12.002000+00:00
-- started: 2026-07-30T12:43:12.161000+00:00
-- ended: 2026-07-30T12:43:13.226000+00:00


WITH uc AS (
  SELECT DISTINCT App_Name, AFID FROM `variant-finance-data-project.Icarus_Cohort.User_Count_AFID`
  WHERE Report_Date >= DATE_SUB(DATE '2026-07-30', INTERVAL 30 DAY)),
m AS (SELECT DISTINCT afid, spend_country_code_afid cty FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Table`)
SELECT COUNT(*) uc_afids, COUNTIF(cty IS NOT NULL) matched FROM uc LEFT JOIN m ON LOWER(uc.AFID)=LOWER(m.afid)
