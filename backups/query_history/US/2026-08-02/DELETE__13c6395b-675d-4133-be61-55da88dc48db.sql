-- job_id: 13c6395b-675d-4133-be61-55da88dc48db
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T01:03:29.627000+00:00
-- started: 2026-08-02T01:03:29.982000+00:00
-- ended: 2026-08-02T01:03:31.828000+00:00


            DELETE FROM `variant-finance-data-project.Sticky_Data.missing_orders`
            WHERE company = 'contractsdotnetllc' AND order_id IN ('207673')
