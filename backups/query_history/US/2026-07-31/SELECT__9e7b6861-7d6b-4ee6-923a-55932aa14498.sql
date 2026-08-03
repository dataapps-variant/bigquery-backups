-- job_id: 9e7b6861-7d6b-4ee6-923a-55932aa14498
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:07:14.713000+00:00
-- started: 2026-07-31T12:07:14.792000+00:00
-- ended: 2026-07-31T12:07:14.910000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
