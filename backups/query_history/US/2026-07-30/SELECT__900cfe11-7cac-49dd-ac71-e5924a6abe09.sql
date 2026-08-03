-- job_id: 900cfe11-7cac-49dd-ac71-e5924a6abe09
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T22:40:40.717000+00:00
-- started: 2026-07-30T22:40:40.868000+00:00
-- ended: 2026-07-30T22:40:41.001000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
