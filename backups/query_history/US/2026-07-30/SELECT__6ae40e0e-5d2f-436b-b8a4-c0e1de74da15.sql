-- job_id: 6ae40e0e-5d2f-436b-b8a4-c0e1de74da15
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T17:04:02.136000+00:00
-- started: 2026-07-30T17:04:02.260000+00:00
-- ended: 2026-07-30T17:04:02.397000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
