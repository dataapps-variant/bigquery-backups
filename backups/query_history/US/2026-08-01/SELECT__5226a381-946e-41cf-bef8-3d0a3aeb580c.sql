-- job_id: 5226a381-946e-41cf-bef8-3d0a3aeb580c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T13:08:04.540000+00:00
-- started: 2026-08-01T13:08:04.651000+00:00
-- ended: 2026-08-01T13:08:04.824000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
