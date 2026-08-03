-- job_id: 1960991f-38d9-488d-9847-32ed8a29b7fb
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T16:09:56.695000+00:00
-- started: 2026-08-01T16:09:56.772000+00:00
-- ended: 2026-08-01T16:09:56.898000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
