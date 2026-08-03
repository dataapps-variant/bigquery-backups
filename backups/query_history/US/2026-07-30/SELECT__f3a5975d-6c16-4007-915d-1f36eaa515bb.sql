-- job_id: f3a5975d-6c16-4007-915d-1f36eaa515bb
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T00:03:29.273000+00:00
-- started: 2026-07-30T00:03:29.384000+00:00
-- ended: 2026-07-30T00:03:29.496000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
