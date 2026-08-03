-- job_id: 024c1758-c570-4c3c-8c62-2518f4d1014b
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T12:01:02.828000+00:00
-- started: 2026-07-29T12:01:02.914000+00:00
-- ended: 2026-07-29T12:01:03.174000+00:00

SELECT '7K_30D' cohort, MAX(Reporting_Date) any_row, MAX(IF(`Net_LTV_Discounted` IS NOT NULL, Reporting_Date, NULL)) AS `Net_LTV_Discounted`, MAX(IF(`Net_ARPU_Discounted` IS NOT NULL, Reporting_Date, NULL)) AS `Net_ARPU_Discounted`, MAX(IF(`Gross_ARPU_Retention_Rate` IS NOT NULL, Reporting_Date, NULL)) AS `Gross_ARPU_Retention_Rate`, MAX(IF(`Net_ARPU_Retention_Rate` IS NOT NULL, Reporting_Date, NULL)) AS `Net_ARPU_Retention_Rate`, MAX(IF(`Subscriptions` IS NOT NULL, Reporting_Date, NULL)) AS `Subscriptions`
     FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE Cohort='7K_30D' AND `Table`='Crystal Ball'
