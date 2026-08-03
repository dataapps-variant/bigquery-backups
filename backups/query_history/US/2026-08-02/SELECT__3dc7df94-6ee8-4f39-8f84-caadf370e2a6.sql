-- job_id: 3dc7df94-6ee8-4f39-8f84-caadf370e2a6
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T09:02:11.129000+00:00
-- started: 2026-08-02T09:02:11.234000+00:00
-- ended: 2026-08-02T09:02:11.377000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
