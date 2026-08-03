-- job_id: 8e7fac97-13e9-43cc-9201-bc737b5e61e1
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T17:03:33.206000+00:00
-- started: 2026-08-02T17:03:33.332000+00:00
-- ended: 2026-08-02T17:03:33.449000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
