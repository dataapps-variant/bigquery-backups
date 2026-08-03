-- job_id: 1653fc73-f719-4b9b-b9be-d27e64fb0291
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T14:01:36.456000+00:00
-- started: 2026-08-02T14:01:36.562000+00:00
-- ended: 2026-08-02T14:01:36.709000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
