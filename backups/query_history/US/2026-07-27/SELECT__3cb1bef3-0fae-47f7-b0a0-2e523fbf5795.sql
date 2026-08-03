-- job_id: 3cb1bef3-0fae-47f7-b0a0-2e523fbf5795
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T22:06:32.336000+00:00
-- started: 2026-07-27T22:06:32.472000+00:00
-- ended: 2026-07-27T22:06:32.577000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
