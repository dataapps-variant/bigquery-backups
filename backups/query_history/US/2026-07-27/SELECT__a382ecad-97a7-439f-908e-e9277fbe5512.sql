-- job_id: a382ecad-97a7-439f-908e-e9277fbe5512
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T18:04:23.482000+00:00
-- started: 2026-07-27T18:04:23.618000+00:00
-- ended: 2026-07-27T18:04:23.754000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
