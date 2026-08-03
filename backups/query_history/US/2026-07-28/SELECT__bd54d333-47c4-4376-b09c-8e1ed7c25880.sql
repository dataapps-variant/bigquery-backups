-- job_id: bd54d333-47c4-4376-b09c-8e1ed7c25880
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T16:07:32.008000+00:00
-- started: 2026-07-28T16:07:32.114000+00:00
-- ended: 2026-07-28T16:07:32.214000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
