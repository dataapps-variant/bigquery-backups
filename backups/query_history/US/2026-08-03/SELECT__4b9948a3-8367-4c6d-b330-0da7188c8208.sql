-- job_id: 4b9948a3-8367-4c6d-b330-0da7188c8208
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:02:06.758000+00:00
-- started: 2026-08-03T10:02:06.877000+00:00
-- ended: 2026-08-03T10:02:07.015000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
