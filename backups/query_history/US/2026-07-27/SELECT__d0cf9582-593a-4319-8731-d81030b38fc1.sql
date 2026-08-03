-- job_id: d0cf9582-593a-4319-8731-d81030b38fc1
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T17:04:29.585000+00:00
-- started: 2026-07-27T17:04:29.685000+00:00
-- ended: 2026-07-27T17:04:29.827000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
