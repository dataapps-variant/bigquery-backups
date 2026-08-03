-- job_id: fd38ed22-6d54-49f2-9eb4-3b3c12872413
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T07:09:17.889000+00:00
-- started: 2026-07-29T07:09:17.984000+00:00
-- ended: 2026-07-29T07:09:18.499000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
