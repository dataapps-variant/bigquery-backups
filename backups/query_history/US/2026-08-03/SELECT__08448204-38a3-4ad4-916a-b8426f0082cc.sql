-- job_id: 08448204-38a3-4ad4-916a-b8426f0082cc
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:03:21.193000+00:00
-- started: 2026-08-03T11:03:21.335000+00:00
-- ended: 2026-08-03T11:03:21.512000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
