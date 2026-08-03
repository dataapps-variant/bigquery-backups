-- job_id: 56ba8638-5518-4512-9b8f-b8f852d877a0
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T23:06:35.478000+00:00
-- started: 2026-07-29T23:06:35.616000+00:00
-- ended: 2026-07-29T23:06:35.739000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
