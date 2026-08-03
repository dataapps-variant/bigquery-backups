-- job_id: d5b5a5a6-dde0-4694-81d6-56980a1a8539
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T16:03:20.691000+00:00
-- started: 2026-07-28T16:03:20.800000+00:00
-- ended: 2026-07-28T16:03:20.924000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
