-- job_id: scheduled_query_6af24064-0000-21ab-89ea-d4f547f40c40
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-03T10:30:02.285000+00:00
-- started: 2026-08-03T10:30:03.064000+00:00
-- ended: 2026-08-03T10:30:06.425000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Reports.BC4_ARPU_Refund_Report` AS
WITH BC4_Data AS (
  SELECT
    Reporting_Date,
    Plan_Name,
    App_Name,
    Entity_Name,
    Gross_ARPU_Discounted AS Gross_ARPU_BC4,
    Net_ARPU_Discounted AS Net_ARPU_BC4
  FROM
    `variant-finance-data-project.ICARUS_Multi.Final_Table`
  WHERE
    BC = 4
    AND Table = 'Regular'
    AND Cohort = '7K'
  GROUP BY
    Reporting_Date,
    Plan_Name,
    App_Name,
    Entity_Name,
    Gross_ARPU_Discounted,
    Net_ARPU_Discounted
),
Refund_Data AS (
  SELECT
    Reporting_Date,
    Plan_Name,
    App_Name,
    Entity_Name,
    SUM(Refund_rate) AS Refund_Percent_BC0_to_BC2
  FROM
    `variant-finance-data-project.ICARUS_Multi.Final_Table`
  WHERE
    BC IN (0, 1, 2)
    AND Table = 'Regular'
    AND Cohort = '7K'
  GROUP BY
    Reporting_Date,
    Plan_Name,
    App_Name,
    Entity_Name
)
SELECT
  BC4_Data.Reporting_Date,
  BC4_Data.Plan_Name,
  BC4_Data.App_Name,
  BC4_Data.Entity_Name,
  BC4_Data.Gross_ARPU_BC4,
  BC4_Data.Net_ARPU_BC4,
  COALESCE(Refund_Data.Refund_Percent_BC0_to_BC2, 0) AS Refund_Percent_BC0_to_BC2
FROM
  BC4_Data
LEFT JOIN
  Refund_Data
ON
  BC4_Data.Reporting_Date = Refund_Data.Reporting_Date
  AND BC4_Data.Plan_Name = Refund_Data.Plan_Name
  AND BC4_Data.App_Name = Refund_Data.App_Name
  AND BC4_Data.Entity_Name = Refund_Data.Entity_Name
ORDER BY
  Reporting_Date DESC,
  Plan_Name;
