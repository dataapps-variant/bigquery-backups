-- job_id: fba97769-e352-4f00-8849-51104a742add
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T04:03:51.904000+00:00
-- started: 2026-07-28T04:03:52.012000+00:00
-- ended: 2026-07-28T04:03:52.169000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
