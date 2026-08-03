-- job_id: 3cc3e998-b022-4c81-8319-1ed551bcf8d9
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T16:07:27.530000+00:00
-- started: 2026-08-01T16:07:27.643000+00:00
-- ended: 2026-08-01T16:07:27.752000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
