-- job_id: 32895e45-12a4-4b4b-8482-dd77e154808f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T06:03:49.941000+00:00
-- started: 2026-08-01T06:03:50.042000+00:00
-- ended: 2026-08-01T06:03:50.168000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
