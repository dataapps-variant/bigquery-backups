-- job_id: 2033ce3f-2888-4a88-97b2-03e245a18c53
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T19:07:18.850000+00:00
-- started: 2026-08-01T19:07:18.949000+00:00
-- ended: 2026-08-01T19:07:19.045000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
