-- job_id: 930956de-dc17-4543-95bc-31bf6ad2accf
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T14:49:12.516000+00:00
-- started: 2026-07-29T14:49:12.576000+00:00
-- ended: 2026-07-29T14:49:12.674000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'
