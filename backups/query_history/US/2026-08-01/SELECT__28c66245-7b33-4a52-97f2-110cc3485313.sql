-- job_id: 28c66245-7b33-4a52-97f2-110cc3485313
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T04:04:55.184000+00:00
-- started: 2026-08-01T04:04:55.302000+00:00
-- ended: 2026-08-01T04:04:55.429000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
