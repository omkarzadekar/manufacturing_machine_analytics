SELECT *
FROM machine_operations_staging;

-- 1) FAILURE RATE OF MACHINES
SELECT 
    SUM(MACHINE_FAILURE) AS FAILURE_COUNT, 
    COUNT(*) AS TOTAL_RECORDS, 
    ROUND((SUM(MACHINE_FAILURE) * 100.0 / COUNT(PRODUCT_ID)),2) AS FAILURE_RATE 
FROM machine_operations_staging;

-- 2) FAILURE Rate BY MACHINE TYPES
SELECT TYPE,
SUM(MACHINE_FAILURE) AS MACHINE_FAILURES,
COUNT(*) AS TOTAL_RECORDS,
ROUND(SUM(MACHINE_FAILURE) * 100.00/ COUNT(*),2) AS FAILURE_RATE
FROM machine_operations_staging
GROUP BY TYPE
ORDER BY FAILURE_RATE DESC;

-- Key Insight- Type L machines fail the most — both in count AND failure rate.

-- 3) Do machines failed under high torque conditions?

SELECT CASE WHEN MACHINE_FAILURE = 1 THEN 'Failed' ELSE 'Not failed' END AS MACHINE_STATUS,
ROUND(AVG(TORQUE),2) AS AVG_TORQUE
FROM machine_operations_staging
GROUP BY MACHINE_STATUS;

--Machines that failed were operating at significantly higher torque (~50)
compared to normal operations (~39)

-- 4) Avg Torque by Failure Type

SELECT 
CASE 
	WHEN TWF = 1 THEN 'TWF'
	WHEN HDF = 1 THEN 'HDF'
	WHEN PWF = 1 THEN 'PWF'
	WHEN OSF = 1 THEN 'OSF'
	WHEN RNF = 1 THEN 'RNF'
	ELSE 'Not Failed'
END AS FAILURE_TYPE,
ROUND(AVG(TORQUE),2) AVG_TORQUE
FROM MACHINE_OPERATIONS_STAGING
GROUP BY FAILURE_TYPE
ORDER BY AVG_TORQUE DESC;

--- Overstrain Failures (OSF) occur at the highest torque levels (~57),indicating excessive mechanical load as the primary cause. 

-- 5) Tool wear vs Failure

SELECT 
CASE 
	WHEN MACHINE_FAILURE = 1 THEN 'Failed'
    ELSE 'Not Failed'
END AS MACHINE_STATUS,
ROUND(AVG(TOOL_WEAR),2) AS TOOL_WEAR
FROM machine_operations_staging
GROUP BY MACHINE_STATUS;

/* Machines that failed had significantly higher tool wear (~144)
compared to normal operations (~107) */

-- 6) Failure Rate per bucket

SELECT 
    TOOL_WEAR_RANGE,
    COUNT(*) AS TOTAL_RECORDS,
    SUM(MACHINE_FAILURE) AS FAILURES,
    ROUND(SUM(MACHINE_FAILURE) * 100.00 / COUNT(*), 2) AS FAILURE_RATE
FROM (
    SELECT 
        CASE
            WHEN TOOL_WEAR BETWEEN 0 AND 50 THEN '0-50'
            WHEN TOOL_WEAR BETWEEN 51 AND 100 THEN '51-100'
            WHEN TOOL_WEAR BETWEEN 101 AND 150 THEN '101-150'
            WHEN TOOL_WEAR BETWEEN 151 AND 200 THEN '151-200'
            WHEN TOOL_WEAR > 200 THEN '200+'
            ELSE 'NOT IN RANGE'
        END AS TOOL_WEAR_RANGE,
        MACHINE_FAILURE
    FROM machine_operations_staging
) AS sub
GROUP BY TOOL_WEAR_RANGE
ORDER BY 
    CASE TOOL_WEAR_RANGE
        WHEN '0-50' THEN 1
        WHEN '51-100' THEN 2
        WHEN '101-150' THEN 3
        WHEN '151-200' THEN 4
        WHEN '200+' THEN 5
        ELSE 6
    END;

-- 7) Temperature Difference vs Failure

SELECT 
CASE
	WHEN MACHINE_FAILURE = 1 THEN 'FAILED'
    ELSE 'NOT_FAILED'
END AS MACHINE_STATUS,
ROUND(AVG(PROCESS_TEMPERATURE - AIR_TEMPERATURE),2) AS AVG_TEMPERATURE_DIFF
FROM MACHINE_OPERATIONS_STAGING
GROUP BY MACHINE_STATUS;


-- Temperature difference does not show a strong correlation with machine failure.
