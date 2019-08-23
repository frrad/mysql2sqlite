PRAGMA synchronous = OFF;
PRAGMA journal_mode = MEMORY;
BEGIN TRANSACTION;
CREATE TABLE `scimag` (
  `ID` integer  NOT NULL PRIMARY KEY AUTOINCREMENT
,  `DOI` varchar(200) NOT NULL
,  `DOI2` varchar(100) NOT NULL DEFAULT ''
,  `Title` varchar(2000) NOT NULL DEFAULT ''
,  `Author` varchar(2000) NOT NULL DEFAULT ''
,  `Year` varchar(10) NOT NULL DEFAULT ''
,  `Month` varchar(10) NOT NULL DEFAULT ''
,  `Day` varchar(10) NOT NULL DEFAULT ''
,  `Volume` varchar(45) NOT NULL DEFAULT ''
,  `Issue` varchar(95) NOT NULL DEFAULT ''
,  `First_page` varchar(45) NOT NULL DEFAULT ''
,  `Last_page` varchar(45) NOT NULL DEFAULT ''
,  `Journal` varchar(500) NOT NULL DEFAULT ''
,  `ISBN` varchar(500) NOT NULL DEFAULT ''
,  `ISSNP` varchar(11) NOT NULL DEFAULT ''
,  `ISSNE` varchar(10) NOT NULL DEFAULT ''
,  `MD5` varchar(32) NOT NULL DEFAULT ''
,  `Filesize` integer  NOT NULL
,  `TimeAdded` timestamp NOT NULL DEFAULT current_timestamp 
,  `JOURNALID` varchar(45) NOT NULL DEFAULT ''
,  `AbstractURL` varchar(500) NOT NULL DEFAULT ''
,  `Attribute1` varchar(500) NOT NULL DEFAULT ''
,  `Attribute2` varchar(1000) NOT NULL DEFAULT ''
,  `Attribute3` varchar(2000) NOT NULL DEFAULT ''
,  `Attribute4` varchar(10000) NOT NULL DEFAULT ''
,  `Attribute5` varchar(256) NOT NULL DEFAULT ''
,  `Attribute6` varchar(45) NOT NULL DEFAULT ''
,  `visible` char(3) NOT NULL DEFAULT ''
,  `PubmedID` varchar(10) NOT NULL DEFAULT ''
,  `PMC` varchar(12) NOT NULL DEFAULT ''
,  `PII` varchar(45) NOT NULL DEFAULT ''
);
CREATE TABLE `scimag_edited` (
  `ID` integer  NOT NULL PRIMARY KEY AUTOINCREMENT
,  `DOI` varchar(200) DEFAULT NULL
,  `Title` varchar(2000) NOT NULL DEFAULT ''
,  `Author` varchar(2000) NOT NULL DEFAULT ''
,  `Year` varchar(10) NOT NULL DEFAULT ''
,  `Month` varchar(10) NOT NULL DEFAULT ''
,  `Day` varchar(10) NOT NULL DEFAULT ''
,  `Volume` varchar(45) NOT NULL DEFAULT ''
,  `Issue` varchar(95) NOT NULL DEFAULT ''
,  `First_page` varchar(45) NOT NULL DEFAULT ''
,  `Last_page` varchar(45) NOT NULL DEFAULT ''
,  `Journal` varchar(500) NOT NULL DEFAULT ''
,  `ISBN` varchar(500) NOT NULL DEFAULT ''
,  `ISSNP` varchar(11) NOT NULL DEFAULT ''
,  `ISSNE` varchar(10) NOT NULL DEFAULT ''
,  `MD5` varchar(32) NOT NULL DEFAULT ''
,  `Filesize` integer  NOT NULL DEFAULT '0'
,  `TimeAdded` timestamp NOT NULL DEFAULT current_timestamp 
,  `JOURNALID` varchar(45) NOT NULL DEFAULT ''
,  `AbstractURL` varchar(500) NOT NULL DEFAULT ''
,  `Attribute1` varchar(500) NOT NULL DEFAULT ''
,  `Attribute2` varchar(1000) NOT NULL DEFAULT ''
,  `Attribute3` varchar(2000) NOT NULL DEFAULT ''
,  `Attribute4` varchar(2000) NOT NULL DEFAULT ''
,  `Attribute5` varchar(256) NOT NULL DEFAULT ''
,  `Attribute6` varchar(45) NOT NULL DEFAULT ''
,  `Attribute7` varchar(500) NOT NULL DEFAULT ''
,  `PII` varchar(45) NOT NULL DEFAULT ''
,  `PMCID` varchar(15) NOT NULL DEFAULT ''
,  `PubmedID` varchar(10) NOT NULL DEFAULT ''
);
CREATE TABLE `publishers` (
  `ID` integer  NOT NULL PRIMARY KEY AUTOINCREMENT
,  `DOICode` varchar(30) NOT NULL DEFAULT ''
,  `Publisher` varchar(300) NOT NULL DEFAULT ''
);
CREATE TABLE `magazines` (
  `ID` integer  NOT NULL PRIMARY KEY AUTOINCREMENT
,  `ISSNP` varchar(10) NOT NULL DEFAULT ''
,  `ISSNE` varchar(10) NOT NULL DEFAULT ''
,  `Magazine` varchar(300) NOT NULL DEFAULT ''
,  `Abbr` varchar(900) NOT NULL DEFAULT ''
,  `Description` varchar(18000) NOT NULL DEFAULT ''
,  `Publisher` varchar(400) NOT NULL DEFAULT ''
,  `JOURNALID` varchar(45) NOT NULL DEFAULT ''
,  `Site_URL` varchar(128) NOT NULL DEFAULT ''
,  `CATEGORY` varchar(445) NOT NULL DEFAULT ''
,  `SITEID_OLD` varchar(45) NOT NULL DEFAULT ''
,  `Previous_Title` varchar(300) NOT NULL DEFAULT ''
,  `Real_title` varchar(300) NOT NULL DEFAULT ''
,  `Years` varchar(100) NOT NULL DEFAULT ''
,  `Volumes` varchar(100) NOT NULL DEFAULT ''
,  `Prefix` varchar(100) NOT NULL DEFAULT ''
,  `Timeadded` timestamp NOT NULL DEFAULT current_timestamp
);
CREATE TABLE `error_report` (
  `id` integer  NOT NULL PRIMARY KEY AUTOINCREMENT
,  `error_type` varchar(45) NOT NULL
,  `doi` varchar(100) NOT NULL
,  `message` varchar(500) NOT NULL
,  `timeadded` timestamp NOT NULL DEFAULT current_timestamp
);
CREATE INDEX "idx_magazines_ISSNP" ON "magazines" (`ISSNP`);
CREATE INDEX "idx_magazines_ISSNE" ON "magazines" (`ISSNE`);
CREATE INDEX "idx_magazines_MAGAZINE" ON "magazines" (`Magazine`);
CREATE INDEX "idx_magazines_JOURNALID" ON "magazines" (`JOURNALID`);
CREATE INDEX "idx_magazines_SITEURL" ON "magazines" (`Site_URL`);
CREATE INDEX "idx_scimag_VOLUMEINDEX" ON "scimag" (`Volume`);
CREATE INDEX "idx_scimag_ISSUEINDEX" ON "scimag" (`Issue`);
CREATE INDEX "idx_scimag_ISSNPINDEX" ON "scimag" (`ISSNP`);
CREATE INDEX "idx_scimag_YEARINDEX" ON "scimag" (`Year`);
CREATE INDEX "idx_scimag_ISSNEINDEX" ON "scimag" (`ISSNE`);
CREATE INDEX "idx_scimag_DOIINDEX" ON "scimag" (`DOI`);
CREATE INDEX "idx_scimag_JOURNALID" ON "scimag" (`JOURNALID`);
CREATE INDEX "idx_scimag_DOIINDEX2" ON "scimag" (`DOI2`);
CREATE INDEX "idx_scimag_PUBMEDINDEX" ON "scimag" (`PubmedID`);
CREATE INDEX "idx_scimag_MD5" ON "scimag" (`MD5`);
CREATE INDEX "idx_scimag_VISIBLEID" ON "scimag" (`visible`,`ID`);
CREATE INDEX "idx_scimag_FULLTEXT" ON "scimag" (`Title`,`Author`);
CREATE INDEX "idx_scimag_edited_VOLUMEINDEX" ON "scimag_edited" (`Volume`);
CREATE INDEX "idx_scimag_edited_ISSUEINDEX" ON "scimag_edited" (`Issue`);
CREATE INDEX "idx_scimag_edited_ISSNPINDEX" ON "scimag_edited" (`ISSNP`);
CREATE INDEX "idx_scimag_edited_YEARINDEX" ON "scimag_edited" (`Year`);
CREATE INDEX "idx_scimag_edited_ISSNEINDEX" ON "scimag_edited" (`ISSNE`);
CREATE INDEX "idx_scimag_edited_DOIINDEX" ON "scimag_edited" (`DOI`);
CREATE INDEX "idx_scimag_edited_MD5FULLTEXT" ON "scimag_edited" (`MD5`);
CREATE INDEX "idx_scimag_edited_FULLTEXT" ON "scimag_edited" (`Title`,`Author`);
END TRANSACTION;
