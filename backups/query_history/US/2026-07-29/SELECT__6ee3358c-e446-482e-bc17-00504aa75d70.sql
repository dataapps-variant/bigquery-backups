-- job_id: 6ee3358c-e446-482e-bc17-00504aa75d70
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T02:06:42.628000+00:00
-- started: 2026-07-29T02:06:42.766000+00:00
-- ended: 2026-07-29T02:06:42.893000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
