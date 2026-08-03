-- job_id: e767f378-9370-48d1-baac-f2354554137e
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:36:10.616000+00:00
-- started: 2026-07-30T12:36:10.781000+00:00
-- ended: 2026-07-30T12:36:10.981000+00:00


SELECT COUNTIF(sp>0) with_spend, COUNTIF(sp=0 OR sp IS NULL) without, COUNT(*) total FROM (
 SELECT Plan_Name, SUM(Daily_Spend) sp FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table`
 WHERE Cohort='7K_30D' AND `Table`='Regular' AND BC=0 GROUP BY 1)
