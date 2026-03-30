SELECT * FROM
machine_operations_raw;

CREATE table machine_operations_staging (UDI int, product_id varchar(50), product_type varchar(10), air_temperature double , process_temperature double, rotational_speed int, torque double, tool_wear int, machine_failure int, TWF int , HDF int, PWF int, OSF int, RNF int);
DROP TABLE IF exists machine_operations_staging;
CREATE TABLE `machine_operations_staging` (
  `UDI` int DEFAULT NULL,
  `Product_ID` text,
  `Type` text,
  `Air_temperature` double DEFAULT NULL,
  `Process_temperature` double DEFAULT NULL,
  `Rotational_speed` int DEFAULT NULL,
  `Torque` double DEFAULT NULL,
  `Tool_wear` int DEFAULT NULL,
  `Machine_failure` int DEFAULT NULL,
  `TWF` int DEFAULT NULL,
  `HDF` int DEFAULT NULL,
  `PWF` int DEFAULT NULL,
  `OSF` int DEFAULT NULL,
  `RNF` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO machine_operations_staging
SELECT *
FROM machine_operations_raw;

SELECT *
FROM machine_operations_staging;

