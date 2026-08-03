-- job_id: 5bae4849-3de7-467b-bd1e-5a6bb2ba7b1d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T17:01:06.078000+00:00
-- started: 2026-08-01T17:01:06.172000+00:00
-- ended: 2026-08-01T17:01:06.277000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
