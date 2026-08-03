-- job_id: c7dfd221-8aaa-4af0-b328-21f87e7bbb47
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T07:01:51.109000+00:00
-- started: 2026-07-29T07:01:51.365000+00:00
-- ended: 2026-07-29T07:01:51.461000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
