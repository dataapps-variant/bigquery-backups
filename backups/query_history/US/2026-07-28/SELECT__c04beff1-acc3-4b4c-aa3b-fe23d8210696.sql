-- job_id: c04beff1-acc3-4b4c-aa3b-fe23d8210696
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:02:00.834000+00:00
-- started: 2026-07-28T14:02:00.964000+00:00
-- ended: 2026-07-28T14:02:01.099000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
