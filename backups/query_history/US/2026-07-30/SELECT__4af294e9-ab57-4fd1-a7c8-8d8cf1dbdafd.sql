-- job_id: 4af294e9-ab57-4fd1-a7c8-8d8cf1dbdafd
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:11:15.305000+00:00
-- started: 2026-07-30T13:11:15.399000+00:00
-- ended: 2026-07-30T13:11:15.516000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
