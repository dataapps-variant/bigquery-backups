-- job_id: 1d066885-694c-4b3b-8db1-dacb78a541c5
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:02:36.869000+00:00
-- started: 2026-07-30T12:02:36.959000+00:00
-- ended: 2026-07-30T12:02:37.170000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
