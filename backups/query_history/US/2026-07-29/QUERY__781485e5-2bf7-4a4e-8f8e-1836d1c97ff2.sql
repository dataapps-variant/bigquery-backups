-- job_id: 781485e5-2bf7-4a4e-8f8e-1836d1c97ff2
-- user: dataapps@variant.net
-- statement_type: None
-- created: 2026-07-29T12:00:34.148000+00:00
-- started: 2026-07-29T12:00:34.163000+00:00
-- ended: 2026-07-29T12:00:34.163000+00:00

SELECT COUNTIF(Net_LTV_Discounted IS NOT NULL) nonnull, COUNT(*) rows
 FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table`
 WHERE Cohort='7K_30D' AND `Table`='Crystal Ball' AND Reporting_Date='2026-07-29'
