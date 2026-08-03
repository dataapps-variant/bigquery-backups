-- job_id: 08098142-55ef-4a42-9174-f44ea3203feb
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T16:06:36.570000+00:00
-- started: 2026-07-28T16:06:36.671000+00:00
-- ended: 2026-07-28T16:06:36.812000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
