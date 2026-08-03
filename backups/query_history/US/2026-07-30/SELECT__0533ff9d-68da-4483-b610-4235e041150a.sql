-- job_id: 0533ff9d-68da-4483-b610-4235e041150a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T10:06:02.111000+00:00
-- started: 2026-07-30T10:06:02.204000+00:00
-- ended: 2026-07-30T10:06:02.348000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
