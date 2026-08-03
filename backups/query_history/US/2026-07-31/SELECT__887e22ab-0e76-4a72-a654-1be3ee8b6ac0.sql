-- job_id: 887e22ab-0e76-4a72-a654-1be3ee8b6ac0
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T17:09:46.231000+00:00
-- started: 2026-07-31T17:09:46.352000+00:00
-- ended: 2026-07-31T17:09:46.932000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
