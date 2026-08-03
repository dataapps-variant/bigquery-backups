-- job_id: 32e4b047-93f8-4113-aad6-579713973934
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T23:01:32.276000+00:00
-- started: 2026-07-28T23:01:32.377000+00:00
-- ended: 2026-07-28T23:01:32.465000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
