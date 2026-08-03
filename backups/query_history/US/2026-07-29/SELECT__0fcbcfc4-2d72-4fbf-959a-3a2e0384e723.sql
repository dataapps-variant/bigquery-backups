-- job_id: 0fcbcfc4-2d72-4fbf-959a-3a2e0384e723
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T18:03:09.286000+00:00
-- started: 2026-07-29T18:03:09.499000+00:00
-- ended: 2026-07-29T18:03:09.658000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
