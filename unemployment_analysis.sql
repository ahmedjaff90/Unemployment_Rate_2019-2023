SELECT
  date AS year,
  `all` AS unemployment_rate,
  
  -- Most affected race
  CASE
    WHEN black > hispanic AND black > white THEN 'black'
    WHEN hispanic > black AND hispanic > white THEN 'hispanic'
    ELSE 'white'
  END AS most_affected_race,

  -- Most affected gender
  CASE
    WHEN women > men THEN 'women'
    ELSE 'men'
  END AS most_affected_gender,

  -- Most affected age group
  CASE
    WHEN `16-24` > GREATEST(`25-54`, `55-64`, `65+`) THEN '16-24'
    WHEN `25-54` > GREATEST(`16-24`, `55-64`, `65+`) THEN '25-54'
    WHEN `55-64` > GREATEST(`16-24`, `25-54`, `65+`) THEN '55-64'
    ELSE '65+'
  END AS most_affected_age_group

FROM
  `unemploymentpopulation.unemploymentpopulation.unemployed_population`
WHERE
  date BETWEEN '2019-01-01' AND '2023-12-31';
