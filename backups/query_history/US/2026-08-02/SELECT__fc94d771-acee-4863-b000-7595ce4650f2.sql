-- job_id: fc94d771-acee-4863-b000-7595ce4650f2
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T06:07:41.109000+00:00
-- started: 2026-08-02T06:07:41.261000+00:00
-- ended: 2026-08-02T06:07:41.354000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
