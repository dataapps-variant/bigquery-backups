-- job_id: 1f4da9b4-ed97-4f00-8f5c-ed949f2c0717
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T15:05:59.913000+00:00
-- started: 2026-07-29T15:06:00.032000+00:00
-- ended: 2026-07-29T15:06:00.150000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
