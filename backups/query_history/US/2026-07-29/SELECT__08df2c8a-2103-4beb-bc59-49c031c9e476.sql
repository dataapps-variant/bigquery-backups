-- job_id: 08df2c8a-2103-4beb-bc59-49c031c9e476
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:12:42.252000+00:00
-- started: 2026-07-29T11:12:42.344000+00:00
-- ended: 2026-07-29T11:12:42.466000+00:00

SELECT MIN(`Report_date`) AS mn, MAX(`Report_date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
