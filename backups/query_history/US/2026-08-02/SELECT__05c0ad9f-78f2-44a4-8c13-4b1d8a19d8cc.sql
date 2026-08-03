-- job_id: 05c0ad9f-78f2-44a4-8c13-4b1d8a19d8cc
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T19:03:49.227000+00:00
-- started: 2026-08-02T19:03:49.340000+00:00
-- ended: 2026-08-02T19:03:49.450000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
