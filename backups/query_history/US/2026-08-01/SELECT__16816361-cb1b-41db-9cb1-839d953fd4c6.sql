-- job_id: 16816361-cb1b-41db-9cb1-839d953fd4c6
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T10:04:39.386000+00:00
-- started: 2026-08-01T10:04:39.500000+00:00
-- ended: 2026-08-01T10:04:39.619000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
