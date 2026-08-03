-- job_id: dfe761fb-4f03-4f39-aeab-2bffcf2ca703
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T16:08:06.880000+00:00
-- started: 2026-07-28T16:08:07.136000+00:00
-- ended: 2026-07-28T16:08:07.268000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
