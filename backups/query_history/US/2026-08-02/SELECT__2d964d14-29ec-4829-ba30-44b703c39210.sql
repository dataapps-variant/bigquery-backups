-- job_id: 2d964d14-29ec-4829-ba30-44b703c39210
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T01:03:19.686000+00:00
-- started: 2026-08-02T01:03:19.819000+00:00
-- ended: 2026-08-02T01:03:20.109000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
