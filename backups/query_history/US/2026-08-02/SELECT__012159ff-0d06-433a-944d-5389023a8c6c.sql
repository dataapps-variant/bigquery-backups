-- job_id: 012159ff-0d06-433a-944d-5389023a8c6c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T05:01:49.211000+00:00
-- started: 2026-08-02T05:01:49.319000+00:00
-- ended: 2026-08-02T05:01:49.440000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
