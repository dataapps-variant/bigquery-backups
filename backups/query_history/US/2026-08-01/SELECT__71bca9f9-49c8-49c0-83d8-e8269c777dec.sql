-- job_id: 71bca9f9-49c8-49c0-83d8-e8269c777dec
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T14:05:07.717000+00:00
-- started: 2026-08-01T14:05:07.831000+00:00
-- ended: 2026-08-01T14:05:07.968000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
