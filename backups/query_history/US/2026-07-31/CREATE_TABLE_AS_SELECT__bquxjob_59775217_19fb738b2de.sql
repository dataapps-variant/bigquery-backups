-- job_id: bquxjob_59775217_19fb738b2de
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-31T08:09:40.673000+00:00
-- started: 2026-07-31T08:09:41.078000+00:00
-- ended: 2026-07-31T08:09:42.370000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets` AS
SELECT * EXCEPT(rn) FROM (
  SELECT *, ROW_NUMBER() OVER (
    PARTITION BY account_name, event_date, display_url_domain
    ORDER BY event_date
  ) AS rn
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets`
)
WHERE rn = 1;
