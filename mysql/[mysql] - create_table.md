## [mysql] - table creation


### create table

```sql
CREATE TABLE `Allis_digitalPower`.`batterydata` (
  `battery_id` VARCHAR(10) NOT NULL,
  `tv` DECIMAL(5,1) NULL,
  `tc` DECIMAL(5,1) NULL,
  `batt1` DECIMAL(5,1) NULL,
  `batt2` DECIMAL(5,1) NULL,
  `fullcap` DECIMAL(5,1) NULL,
  `vper` DECIMAL(5,1) NULL,
  `rec` DECIMAL(5,1) NULL,
  `cycno` INT NULL,
  `balstat` INT NULL,
  PRIMARY KEY (`battery_id`),
  UNIQUE INDEX `battery_id_UNIQUE` (`battery_id` ASC) VISIBLE);

```

### alter table

```sql
ALTER TABLE `Allis_digitalPower`.`batterydata` 
ADD COLUMN `wrttien_at` VARCHAR(45) NULL AFTER `balstat`,
ADD COLUMN `unix_timestamp` INT NULL AFTER `wrttien_at`;

```
```sql
ALTER TABLE `Allis_digitalPower`.`datarow` 
ADD COLUMN `unix_timestamp` INT NULL AFTER `gw_time`;
```

```sql
ALTER TABLE `Allis_digitalPower`.`batterydata` 
ADD COLUMN `gateway_id` VARCHAR(10) NULL AFTER `unix_timestamp`,
ADD COLUMN `location` VARCHAR(45) NULL AFTER `gateway_id`,
ADD COLUMN `field` VARCHAR(45) NULL AFTER `location`,
ADD COLUMN `account` VARCHAR(45) NULL AFTER `field`,
ADD COLUMN `battery_type` VARCHAR(45) NULL AFTER `account`;

```