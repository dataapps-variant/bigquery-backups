-- job_id: 14e24cb8-b1a9-4101-8b3b-9f6c79456e13
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T11:07:30.427000+00:00
-- started: 2026-07-28T11:07:30.535000+00:00
-- ended: 2026-07-28T11:07:30.657000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
