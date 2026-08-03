-- job_id: 35f39447-5f9a-46ab-be19-fbb6c4f2679f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T04:02:44.259000+00:00
-- started: 2026-07-31T04:02:44.376000+00:00
-- ended: 2026-07-31T04:02:44.504000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
