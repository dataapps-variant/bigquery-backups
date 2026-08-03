-- job_id: f8deef8d-b66c-42e8-b8ea-c90ba177b488
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T11:07:41.869000+00:00
-- started: 2026-07-28T11:07:41.969000+00:00
-- ended: 2026-07-28T11:07:42.065000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
