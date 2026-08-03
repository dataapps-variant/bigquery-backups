-- job_id: 9d93e0d7-bcd7-46e3-b0ae-3c2ce5b68efc
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T23:02:14.677000+00:00
-- started: 2026-07-30T23:02:14.780000+00:00
-- ended: 2026-07-30T23:02:14.908000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
