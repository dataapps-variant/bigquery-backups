-- job_id: afd8e4e3-a3f9-4e23-bfb5-eaed603a3a77
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:07:40.773000+00:00
-- started: 2026-07-30T13:07:40.892000+00:00
-- ended: 2026-07-30T13:07:40.991000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
