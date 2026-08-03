-- job_id: bee53d7b-4c89-4291-a739-8f15717c87b6
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T16:05:12.302000+00:00
-- started: 2026-08-01T16:05:12.412000+00:00
-- ended: 2026-08-01T16:05:12.523000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
