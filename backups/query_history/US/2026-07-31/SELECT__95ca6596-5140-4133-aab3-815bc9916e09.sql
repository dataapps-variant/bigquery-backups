-- job_id: 95ca6596-5140-4133-aab3-815bc9916e09
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T09:03:39.756000+00:00
-- started: 2026-07-31T09:03:39.871000+00:00
-- ended: 2026-07-31T09:03:40.036000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
