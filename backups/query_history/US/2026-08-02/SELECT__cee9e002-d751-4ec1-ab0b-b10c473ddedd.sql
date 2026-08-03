-- job_id: cee9e002-d751-4ec1-ab0b-b10c473ddedd
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:08:46.737000+00:00
-- started: 2026-08-02T00:08:46.893000+00:00
-- ended: 2026-08-02T00:08:47.082000+00:00


                SELECT DISTINCT order_id 
                FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
                WHERE company = 'mindworksllc' AND order_id IS NOT NULL
