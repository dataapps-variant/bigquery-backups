-- job_id: 1c31f344-acc8-4f07-b6bf-fd97d1172efd
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:37:53.436000+00:00
-- started: 2026-07-30T12:37:53.595000+00:00
-- ended: 2026-07-30T12:37:53.816000+00:00


WITH fin AS (
  SELECT Plan_Name p, SUM(Daily_Spend) sp, SUM(Daily_New_Users) nu, COUNTIF(T30D_New_Users IS NOT NULL) t30_nn
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE Cohort='7K_30D' AND `Table`='Regular' AND BC=0 GROUP BY 1),
mn AS (
  SELECT Product_Name_Final p, SUM(Recent_Spend) rs, SUM(Recent_Users) ru
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE Billing_Cycle=0 GROUP BY 1)
SELECT f.p, f.sp fin_daily_spend, f.nu fin_daily_users, f.t30_nn, m.rs main_recent_spend, m.ru main_recent_users
FROM fin f LEFT JOIN mn m USING(p)
ORDER BY (f.sp IS NULL OR f.sp=0) DESC, m.rs DESC NULLS LAST LIMIT 25
