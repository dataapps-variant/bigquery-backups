-- job_id: 9fca3c65-29df-4317-a82a-16896b548dcf
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T03:07:08.187000+00:00
-- started: 2026-08-02T03:07:08.481000+00:00
-- ended: 2026-08-02T03:07:08.599000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
