-- job_id: 7dddb604-851c-4452-b44e-27f1110999be
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T00:10:12.881000+00:00
-- started: 2026-07-28T00:10:13.010000+00:00
-- ended: 2026-07-28T00:10:13.137000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
