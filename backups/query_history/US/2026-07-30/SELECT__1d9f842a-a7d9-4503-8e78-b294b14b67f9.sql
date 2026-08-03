-- job_id: 1d9f842a-a7d9-4503-8e78-b294b14b67f9
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T15:03:54.755000+00:00
-- started: 2026-07-30T15:03:54.925000+00:00
-- ended: 2026-07-30T15:03:55.055000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
