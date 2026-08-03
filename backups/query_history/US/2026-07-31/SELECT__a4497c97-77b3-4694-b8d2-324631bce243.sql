-- job_id: a4497c97-77b3-4694-b8d2-324631bce243
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T14:06:28.968000+00:00
-- started: 2026-07-31T14:06:29.109000+00:00
-- ended: 2026-07-31T14:06:29.209000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
