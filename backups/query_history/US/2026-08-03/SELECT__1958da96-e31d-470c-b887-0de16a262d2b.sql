-- job_id: 1958da96-e31d-470c-b887-0de16a262d2b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T00:09:23.375000+00:00
-- started: 2026-08-03T00:09:23.508000+00:00
-- ended: 2026-08-03T00:09:23.643000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
