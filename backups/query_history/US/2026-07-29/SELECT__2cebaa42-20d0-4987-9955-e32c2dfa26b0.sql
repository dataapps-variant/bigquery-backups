-- job_id: 2cebaa42-20d0-4987-9955-e32c2dfa26b0
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T05:03:44.269000+00:00
-- started: 2026-07-29T05:03:44.453000+00:00
-- ended: 2026-07-29T05:03:44.576000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
