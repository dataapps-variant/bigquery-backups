-- job_id: 05c31137-1537-4266-a4a0-b24b14c97b03
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:06:47.925000+00:00
-- started: 2026-07-30T13:06:48.012000+00:00
-- ended: 2026-07-30T13:06:48.148000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
