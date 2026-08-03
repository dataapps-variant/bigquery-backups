-- job_id: 4f0b97fa-8f78-4598-b775-1a0168af9818
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:40:16.454000+00:00
-- started: 2026-07-30T12:40:16.533000+00:00
-- ended: 2026-07-30T12:40:16.742000+00:00


SELECT Plan_Name, MAX(Reporting_Date) last_spend_date, SUM(Daily_Spend) tot
FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE Cohort='7K_30D' AND `Table`='Regular' AND BC=0 AND Daily_Spend>0
GROUP BY 1 ORDER BY last_spend_date DESC LIMIT 20
