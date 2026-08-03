-- job_id: 19977fb5-b74a-4a44-87db-155dde585435
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:08:35.198000+00:00
-- started: 2026-07-30T13:08:35.312000+00:00
-- ended: 2026-07-30T13:08:35.421000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
