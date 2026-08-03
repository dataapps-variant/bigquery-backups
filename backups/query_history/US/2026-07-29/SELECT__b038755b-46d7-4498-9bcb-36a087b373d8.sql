-- job_id: b038755b-46d7-4498-9bcb-36a087b373d8
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T12:01:04.565000+00:00
-- started: 2026-07-29T12:01:04.655000+00:00
-- ended: 2026-07-29T12:01:05.060000+00:00

SELECT '7K' cohort, MAX(Reporting_Date) any_row, MAX(IF(`Net_LTV_Discounted` IS NOT NULL, Reporting_Date, NULL)) AS `Net_LTV_Discounted`, MAX(IF(`Net_ARPU_Discounted` IS NOT NULL, Reporting_Date, NULL)) AS `Net_ARPU_Discounted`, MAX(IF(`Gross_ARPU_Retention_Rate` IS NOT NULL, Reporting_Date, NULL)) AS `Gross_ARPU_Retention_Rate`, MAX(IF(`Net_ARPU_Retention_Rate` IS NOT NULL, Reporting_Date, NULL)) AS `Net_ARPU_Retention_Rate`, MAX(IF(`Subscriptions` IS NOT NULL, Reporting_Date, NULL)) AS `Subscriptions`
     FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE Cohort='7K' AND `Table`='Crystal Ball'
