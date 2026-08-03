-- job_id: 35f7718c-ea29-4941-a19c-08319720cd78
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T17:03:15.745000+00:00
-- started: 2026-07-30T17:03:15.867000+00:00
-- ended: 2026-07-30T17:03:15.996000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
