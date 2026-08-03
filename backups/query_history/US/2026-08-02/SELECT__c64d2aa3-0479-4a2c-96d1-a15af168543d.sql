-- job_id: c64d2aa3-0479-4a2c-96d1-a15af168543d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:09:39.521000+00:00
-- started: 2026-08-02T00:09:39.607000+00:00
-- ended: 2026-08-02T00:09:39.851000+00:00


                SELECT DISTINCT order_id 
                FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
                WHERE company = 'mindworksllc' AND order_id IS NOT NULL
