-- job_id: 50fa4ace-81b4-4301-b84e-11d7cad29af8
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T06:53:37.852000+00:00
-- started: 2026-07-28T06:53:37.943000+00:00
-- ended: 2026-07-28T06:53:38.062000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
