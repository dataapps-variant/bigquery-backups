-- job_id: c54b887b-885a-4563-bdd1-975390b6ef39
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T17:02:35.670000+00:00
-- started: 2026-07-27T17:02:35.763000+00:00
-- ended: 2026-07-27T17:02:35.910000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
