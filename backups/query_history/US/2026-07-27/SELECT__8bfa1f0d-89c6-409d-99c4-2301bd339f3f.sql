-- job_id: 8bfa1f0d-89c6-409d-99c4-2301bd339f3f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T22:03:26.371000+00:00
-- started: 2026-07-27T22:03:26.477000+00:00
-- ended: 2026-07-27T22:03:26.596000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
