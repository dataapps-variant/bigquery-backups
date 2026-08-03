-- job_id: 7802b4ae-3a8c-41ab-aab7-7ac81b638d62
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T03:01:58.249000+00:00
-- started: 2026-07-30T03:01:58.346000+00:00
-- ended: 2026-07-30T03:01:58.500000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
