-- job_id: 05c6b411-4b26-43a1-b813-b8ccc4756c98
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T04:02:21.587000+00:00
-- started: 2026-07-31T04:02:21.718000+00:00
-- ended: 2026-07-31T04:02:21.851000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
