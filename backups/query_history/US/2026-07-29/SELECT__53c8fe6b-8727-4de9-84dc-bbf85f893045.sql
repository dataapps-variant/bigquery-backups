-- job_id: 53c8fe6b-8727-4de9-84dc-bbf85f893045
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T04:01:40.273000+00:00
-- started: 2026-07-29T04:01:40.393000+00:00
-- ended: 2026-07-29T04:01:40.518000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
