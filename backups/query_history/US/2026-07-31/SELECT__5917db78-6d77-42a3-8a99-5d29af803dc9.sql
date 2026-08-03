-- job_id: 5917db78-6d77-42a3-8a99-5d29af803dc9
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T15:21:33.582000+00:00
-- started: 2026-07-31T15:21:33.695000+00:00
-- ended: 2026-07-31T15:21:33.860000+00:00


        WITH ranked AS (
            SELECT
                *,
                ROW_NUMBER() OVER (
                    PARTITION BY insight_id ORDER BY revision DESC
                ) AS _rn
            FROM `variant-finance-data-project.CWC.Weekly_Insights`
            WHERE report_date IN UNNEST(@report_dates)
        )
        SELECT * EXCEPT (_rn)
        FROM ranked
        WHERE _rn = 1
          AND NOT COALESCE(is_deleted, FALSE)
          AND (@app   IS NULL OR app  = @app)
          AND (@afid  IS NULL OR afid = @afid)
          AND (@tier  IS NULL OR tier = @tier)
        ORDER BY report_date DESC,
                 CASE WHEN tier = 'summary' THEN 0 ELSE 1 END,
                 sort_order
