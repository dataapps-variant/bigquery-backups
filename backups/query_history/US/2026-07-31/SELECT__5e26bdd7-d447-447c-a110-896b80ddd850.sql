-- job_id: 5e26bdd7-d447-447c-a110-896b80ddd850
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T20:03:53.304000+00:00
-- started: 2026-07-31T20:03:53.400000+00:00
-- ended: 2026-07-31T20:03:53.546000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
