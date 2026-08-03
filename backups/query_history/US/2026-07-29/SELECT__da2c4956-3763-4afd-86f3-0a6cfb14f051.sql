-- job_id: da2c4956-3763-4afd-86f3-0a6cfb14f051
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T15:09:55.099000+00:00
-- started: 2026-07-29T15:09:55.220000+00:00
-- ended: 2026-07-29T15:09:55.344000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
