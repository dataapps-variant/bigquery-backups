-- job_id: b8490743-e840-421c-9666-5781d9771943
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T10:04:54.183000+00:00
-- started: 2026-07-29T10:04:54.291000+00:00
-- ended: 2026-07-29T10:04:54.404000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
