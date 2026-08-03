-- job_id: 8917457f-4a75-491f-b17c-56823069b504
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T06:02:39.788000+00:00
-- started: 2026-07-31T06:02:39.896000+00:00
-- ended: 2026-07-31T06:02:40.021000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
