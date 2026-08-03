-- job_id: f564644c-0c66-44c7-97cc-bdc343c6d98f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T15:03:19.227000+00:00
-- started: 2026-08-02T15:03:19.315000+00:00
-- ended: 2026-08-02T15:03:19.430000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
