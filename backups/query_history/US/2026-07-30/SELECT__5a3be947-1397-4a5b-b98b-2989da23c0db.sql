-- job_id: 5a3be947-1397-4a5b-b98b-2989da23c0db
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:39:02.950000+00:00
-- started: 2026-07-30T12:39:03.065000+00:00
-- ended: 2026-07-30T12:39:03.264000+00:00


SELECT BC, COUNT(*) n, SUM(Daily_Spend) sp, SUM(Daily_New_Users) nu
FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE Plan_Name='PD4988ST' AND Spend_Country_Code_AFID='US'
 AND Cohort='7K_30D' AND `Table`='Regular' GROUP BY 1 ORDER BY 1
