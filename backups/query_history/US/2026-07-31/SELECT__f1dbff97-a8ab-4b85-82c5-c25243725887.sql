-- job_id: f1dbff97-a8ab-4b85-82c5-c25243725887
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T07:02:22.721000+00:00
-- started: 2026-07-31T07:02:22.837000+00:00
-- ended: 2026-07-31T07:02:22.968000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
