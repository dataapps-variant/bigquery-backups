-- job_id: 966272c3-06ab-4c0c-87c4-890d34b9571a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T06:10:10.945000+00:00
-- started: 2026-07-28T06:10:11.145000+00:00
-- ended: 2026-07-28T06:10:11.335000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
