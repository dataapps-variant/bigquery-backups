-- job_id: b997381b-4cd6-4d6e-af2f-ef8f81c09b4c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:06:55.936000+00:00
-- started: 2026-07-28T09:06:56.067000+00:00
-- ended: 2026-07-28T09:06:56.182000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
