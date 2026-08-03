-- job_id: a40938bc-f597-45f0-84ba-a01537c5b8b8
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T22:01:36.261000+00:00
-- started: 2026-07-29T22:01:36.392000+00:00
-- ended: 2026-07-29T22:01:36.536000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
