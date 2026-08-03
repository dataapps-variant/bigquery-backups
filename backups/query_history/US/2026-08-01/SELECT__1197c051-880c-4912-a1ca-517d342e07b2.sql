-- job_id: 1197c051-880c-4912-a1ca-517d342e07b2
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T09:09:24.140000+00:00
-- started: 2026-08-01T09:09:24.297000+00:00
-- ended: 2026-08-01T09:09:24.394000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
