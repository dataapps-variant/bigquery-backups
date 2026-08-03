-- job_id: 8d56b5c9-7d22-4321-85ce-a4fed8036778
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T10:03:25.367000+00:00
-- started: 2026-08-02T10:03:25.483000+00:00
-- ended: 2026-08-02T10:03:25.615000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
