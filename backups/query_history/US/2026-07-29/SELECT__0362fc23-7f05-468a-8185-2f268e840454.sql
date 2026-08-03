-- job_id: 0362fc23-7f05-468a-8185-2f268e840454
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T13:30:16.534000+00:00
-- started: 2026-07-29T13:30:16.620000+00:00
-- ended: 2026-07-29T13:30:16.739000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
