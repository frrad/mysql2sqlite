

/*!50100 PARTITION BY RANGE (YEAR(date))
(PARTITION p6 VALUES LESS THAN (2012) ENGINE = InnoDB,
 PARTITION p7 VALUES LESS THAN (2013) ENGINE = InnoDB)

