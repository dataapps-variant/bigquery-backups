-- job_id: b96ca929-d555-45d3-8f9f-b00bb274cdee
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T02:02:18.299000+00:00
-- started: 2026-07-28T02:02:18.390000+00:00
-- ended: 2026-07-28T02:02:18.522000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
