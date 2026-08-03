-- job_id: 2b192fea-4965-4d86-9d30-bc25c965268d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T19:01:49.216000+00:00
-- started: 2026-07-27T19:01:49.430000+00:00
-- ended: 2026-07-27T19:01:49.572000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
