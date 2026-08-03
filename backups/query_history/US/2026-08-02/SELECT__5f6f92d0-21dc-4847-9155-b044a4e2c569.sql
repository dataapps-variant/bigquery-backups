-- job_id: 5f6f92d0-21dc-4847-9155-b044a4e2c569
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:05:22.050000+00:00
-- started: 2026-08-02T00:05:22.140000+00:00
-- ended: 2026-08-02T00:05:22.358000+00:00


                SELECT DISTINCT order_id 
                FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
                WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
