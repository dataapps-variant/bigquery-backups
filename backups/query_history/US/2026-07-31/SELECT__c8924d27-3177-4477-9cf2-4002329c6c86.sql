-- job_id: c8924d27-3177-4477-9cf2-4002329c6c86
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T02:03:35.037000+00:00
-- started: 2026-07-31T02:03:35.122000+00:00
-- ended: 2026-07-31T02:03:35.252000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
