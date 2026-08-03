-- job_id: d31121cd-6a45-4c93-971a-0ebd48282426
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T13:07:39.671000+00:00
-- started: 2026-08-02T13:07:39.757000+00:00
-- ended: 2026-08-02T13:07:39.872000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
