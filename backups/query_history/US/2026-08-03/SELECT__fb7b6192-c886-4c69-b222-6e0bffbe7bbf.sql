-- job_id: fb7b6192-c886-4c69-b222-6e0bffbe7bbf
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:19.867000+00:00
-- started: 2026-08-03T13:01:20.003000+00:00
-- ended: 2026-08-03T13:01:20.149000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
