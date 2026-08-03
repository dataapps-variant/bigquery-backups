-- job_id: fcb46a35-d43f-475d-a866-e52a5e86b03f
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:40:18.071000+00:00
-- started: 2026-07-30T12:40:18.212000+00:00
-- ended: 2026-07-30T12:40:18.448000+00:00


SELECT MAX(IF(Daily_Spend>0, Reporting_Date, NULL)) mx_spend,
       MAX(IF(Daily_New_Users>0, Reporting_Date, NULL)) mx_nu,
       MAX(IF(Daily_CAC IS NOT NULL, Reporting_Date, NULL)) mx_cac,
       MAX(Reporting_Date) mx_any
FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE Cohort='7K_30D' AND `Table`='Regular'
