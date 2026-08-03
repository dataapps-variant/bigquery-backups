-- job_id: c6d9b670-3dcc-461b-9c58-0b5018f6ed85
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:04.997000+00:00
-- started: 2026-07-28T10:03:05.086000+00:00
-- ended: 2026-07-28T10:03:05.216000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
