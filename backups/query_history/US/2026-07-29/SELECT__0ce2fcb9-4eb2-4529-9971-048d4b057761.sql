-- job_id: 0ce2fcb9-4eb2-4529-9971-048d4b057761
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T14:06:59.500000+00:00
-- started: 2026-07-29T14:06:59.765000+00:00
-- ended: 2026-07-29T14:06:59.859000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
