-- job_id: 9750ccfc-a693-4791-841c-87a567c7b320
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:06:52.969000+00:00
-- started: 2026-07-28T13:06:53.093000+00:00
-- ended: 2026-07-28T13:06:53.198000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
