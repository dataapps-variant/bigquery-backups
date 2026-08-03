-- job_id: 8114925d-ca56-4091-856c-91c1818ffc37
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T15:03:09.069000+00:00
-- started: 2026-07-31T15:03:09.214000+00:00
-- ended: 2026-07-31T15:03:09.340000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
