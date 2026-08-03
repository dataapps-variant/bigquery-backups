-- job_id: 26defd52-8946-4f71-94a8-7853778c0110
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T23:03:45.706000+00:00
-- started: 2026-08-02T23:03:45.804000+00:00
-- ended: 2026-08-02T23:03:45.930000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
