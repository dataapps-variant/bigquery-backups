-- job_id: 830d9994-3af3-4cc5-bf92-4427cd386350
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T16:08:30.113000+00:00
-- started: 2026-07-28T16:08:30.212000+00:00
-- ended: 2026-07-28T16:08:30.319000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
