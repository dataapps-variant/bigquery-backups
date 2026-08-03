-- job_id: a075def8-0b31-412b-a1a4-5a9dccacc445
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T21:05:11.406000+00:00
-- started: 2026-07-30T21:05:11.522000+00:00
-- ended: 2026-07-30T21:05:11.658000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
