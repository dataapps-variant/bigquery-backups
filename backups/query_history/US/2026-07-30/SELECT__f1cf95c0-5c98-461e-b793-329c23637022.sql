-- job_id: f1cf95c0-5c98-461e-b793-329c23637022
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:36:08.886000+00:00
-- started: 2026-07-30T12:36:08.990000+00:00
-- ended: 2026-07-30T12:36:09.233000+00:00


SELECT Plan_Name, COUNT(*) n, SUM(Daily_Spend) sp, SUM(Daily_New_Users) nu,
       COUNTIF(Daily_CAC IS NOT NULL) cac_nn, MAX(Reporting_Date) mx
FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE Cohort='7K_30D' AND `Table`='Regular' AND BC=0
GROUP BY 1 ORDER BY sp DESC NULLS LAST LIMIT 15
