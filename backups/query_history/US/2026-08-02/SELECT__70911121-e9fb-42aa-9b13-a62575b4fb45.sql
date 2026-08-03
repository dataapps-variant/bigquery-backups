-- job_id: 70911121-e9fb-42aa-9b13-a62575b4fb45
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T17:01:50.822000+00:00
-- started: 2026-08-02T17:01:50.917000+00:00
-- ended: 2026-08-02T17:01:51.041000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
