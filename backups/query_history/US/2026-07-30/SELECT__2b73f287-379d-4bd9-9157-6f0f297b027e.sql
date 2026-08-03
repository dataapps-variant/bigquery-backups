-- job_id: 2b73f287-379d-4bd9-9157-6f0f297b027e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T09:06:44.186000+00:00
-- started: 2026-07-30T09:06:44.285000+00:00
-- ended: 2026-07-30T09:06:44.410000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
