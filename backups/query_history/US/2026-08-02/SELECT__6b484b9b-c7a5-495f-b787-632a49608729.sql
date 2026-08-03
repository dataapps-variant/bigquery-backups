-- job_id: 6b484b9b-c7a5-495f-b787-632a49608729
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T22:03:39.613000+00:00
-- started: 2026-08-02T22:03:39.738000+00:00
-- ended: 2026-08-02T22:03:39.864000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
