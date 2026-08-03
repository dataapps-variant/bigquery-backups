-- job_id: 2d4fcbf0-3527-4112-8a6d-ba01f4e055dd
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T19:03:51.422000+00:00
-- started: 2026-07-31T19:03:51.550000+00:00
-- ended: 2026-07-31T19:03:51.675000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
