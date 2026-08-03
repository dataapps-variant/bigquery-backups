-- job_id: job_71oJ7Rle9xybKQnV98_BgSHwpimQ
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T09:50:10.240000+00:00
-- started: 2026-07-28T09:50:10.459000+00:00
-- ended: 2026-07-28T09:50:10.853000+00:00


SELECT sum(amount), date FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend`
where date = "2026-07-28"
group by Date
