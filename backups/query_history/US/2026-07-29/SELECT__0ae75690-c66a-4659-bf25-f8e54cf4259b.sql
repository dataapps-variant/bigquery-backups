-- job_id: 0ae75690-c66a-4659-bf25-f8e54cf4259b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T13:21:33.066000+00:00
-- started: 2026-07-29T13:21:33.161000+00:00
-- ended: 2026-07-29T13:21:33.271000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
