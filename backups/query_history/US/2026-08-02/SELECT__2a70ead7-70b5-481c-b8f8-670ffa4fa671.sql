-- job_id: 2a70ead7-70b5-481c-b8f8-670ffa4fa671
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T01:03:42.416000+00:00
-- started: 2026-08-02T01:03:42.491000+00:00
-- ended: 2026-08-02T01:03:42.679000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
