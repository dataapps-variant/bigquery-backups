-- job_id: f149c999-440d-499c-816c-80e35fcfb671
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T14:02:56.109000+00:00
-- started: 2026-07-29T14:02:56.197000+00:00
-- ended: 2026-07-29T14:02:56.289000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
