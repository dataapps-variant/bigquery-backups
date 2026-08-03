-- job_id: 49ca724b-1417-4dd7-aa2a-d3da4f2ba0a7
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T23:04:49.715000+00:00
-- started: 2026-07-27T23:04:49.840000+00:00
-- ended: 2026-07-27T23:04:49.970000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
