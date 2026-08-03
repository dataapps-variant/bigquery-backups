-- job_id: 3e2ac792-64a1-4cb2-b9fc-50d5f522d3ed
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T17:06:02.686000+00:00
-- started: 2026-07-29T17:06:02.814000+00:00
-- ended: 2026-07-29T17:06:02.916000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
