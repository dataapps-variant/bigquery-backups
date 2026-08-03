-- job_id: job_AvwTXWgaGWqrDcXQoMIkRUCShu8l
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T12:04:29.814000+00:00
-- started: 2026-07-28T12:04:29.929000+00:00
-- ended: 2026-07-28T12:04:30.193000+00:00

SELECT DISTINCT(Final_URL_suffix_AFID), allocated_spend FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
where Date = "2026-07-27"
and App_name = "PD"
