-- job_id: 4f552a53-e5c2-447c-abdb-d484a574dd0c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T16:08:40.356000+00:00
-- started: 2026-08-01T16:08:40.448000+00:00
-- ended: 2026-08-01T16:08:40.651000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
