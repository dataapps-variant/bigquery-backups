-- job_id: 8e9dd100-0269-4027-9cf5-dfe286701fb3
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T19:03:59.191000+00:00
-- started: 2026-08-02T19:03:59.294000+00:00
-- ended: 2026-08-02T19:03:59.411000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
