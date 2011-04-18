-- phpMyAdmin SQL Dump
-- version 3.2.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 15, 2011 at 08:38 PM
-- Server version: 5.1.44
-- PHP Version: 5.3.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `CS300`
--

-- --------------------------------------------------------

--
-- Table structure for table `Auction`
--

DROP TABLE IF EXISTS `Auction`;
CREATE TABLE `Auction` (
  `idAuction` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `Title` varchar(90) CHARACTER SET utf8 NOT NULL,
  `Description` text CHARACTER SET utf8 NOT NULL,
  `Picture` mediumblob,
  `Finished` bit(1) NOT NULL DEFAULT b'0',
  `Sold` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`idAuction`),
  KEY `AuctionUserId` (`UserId`),
  KEY `CategoryId` (`CategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Auction`
--


-- --------------------------------------------------------

--
-- Table structure for table `Authority`
--

DROP TABLE IF EXISTS `Authority`;
CREATE TABLE `Authority` (
  `idAuthority` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `Authority` varchar(10) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`idAuthority`),
  KEY `UserId` (`UserId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- Dumping data for table `Authority`
--

INSERT INTO `Authority` VALUES(1, 1, 'ROLE_ADMIN');
INSERT INTO `Authority` VALUES(2, 1, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `Bid`
--

DROP TABLE IF EXISTS `Bid`;
CREATE TABLE `Bid` (
  `idBid` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `AuctionId` int(11) NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Time` datetime NOT NULL,
  PRIMARY KEY (`idBid`),
  KEY `BidUserId` (`UserId`),
  KEY `BidAuctionId` (`AuctionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Bid`
--


-- --------------------------------------------------------

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
CREATE TABLE `Category` (
  `idCategory` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`idCategory`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=8 ;

--
-- Dumping data for table `Category`
--

INSERT INTO `Category` VALUES(1, 'Books');
INSERT INTO `Category` VALUES(2, 'Collectibles & Art');
INSERT INTO `Category` VALUES(3, 'Electronics & Technology');
INSERT INTO `Category` VALUES(4, 'Fashion');
INSERT INTO `Category` VALUES(5, 'Home, Outdoors & Decor');
INSERT INTO `Category` VALUES(6, 'Automotive');
INSERT INTO `Category` VALUES(7, 'Movies, Music & Games');

-- --------------------------------------------------------

--
-- Table structure for table `Feedback`
--

DROP TABLE IF EXISTS `Feedback`;
CREATE TABLE `Feedback` (
  `idSellerFeedback` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `AuctionId` int(11) NOT NULL,
  `Feedback` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Rating` tinyint(11) NOT NULL,
  PRIMARY KEY (`idSellerFeedback`),
  KEY `FeedbackUserId` (`UserId`),
  KEY `FeedbackAuctionId` (`AuctionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Feedback`
--


-- --------------------------------------------------------

--
-- Table structure for table `PersonalInfo`
--

DROP TABLE IF EXISTS `PersonalInfo`;
CREATE TABLE `PersonalInfo` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(90) CHARACTER SET utf8 NOT NULL,
  `MiddleName` varchar(90) CHARACTER SET utf8 DEFAULT NULL,
  `LastName` varchar(90) CHARACTER SET utf8 NOT NULL,
  `Address1` varchar(90) CHARACTER SET utf8 NOT NULL,
  `Address2` varchar(90) CHARACTER SET utf8 DEFAULT NULL,
  `City` varchar(90) CHARACTER SET utf8 NOT NULL,
  `State` varchar(45) CHARACTER SET utf8 NOT NULL,
  `Country` varchar(90) CHARACTER SET utf8 NOT NULL,
  `Zipcode` varchar(10) CHARACTER SET utf8 NOT NULL,
  `PhoneNumber` varchar(16) CHARACTER SET utf8 NOT NULL,
  `EmailAddress` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`idUser`),
  KEY `PersonalInfoIdUser` (`idUser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=10 ;

--
-- Dumping data for table `PersonalInfo`
--

INSERT INTO `PersonalInfo` VALUES(1, 'admin', NULL, 'admin', 'nowhere', NULL, 'nowhere', 'nowhere', 'nowhere', 'nowhere', 'none', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(45) CHARACTER SET utf8 NOT NULL,
  `Password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Enabled` bit(1) NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `Username` (`Username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=10 ;

--
-- Dumping data for table `User`
--

INSERT INTO `User` VALUES(1, 'admin', 'secret', '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Auction`
--
ALTER TABLE `Auction`
  ADD CONSTRAINT `AuctionUserId` FOREIGN KEY (`UserId`) REFERENCES `User` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Auction_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `Category` (`idCategory`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Authority`
--
ALTER TABLE `Authority`
  ADD CONSTRAINT `Authority_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `User` (`idUser`);

--
-- Constraints for table `Bid`
--
ALTER TABLE `Bid`
  ADD CONSTRAINT `BidAuctionId` FOREIGN KEY (`AuctionId`) REFERENCES `Auction` (`idAuction`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `BidUserId` FOREIGN KEY (`UserId`) REFERENCES `User` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Feedback`
--
ALTER TABLE `Feedback`
  ADD CONSTRAINT `FeedbackAuctionId` FOREIGN KEY (`AuctionId`) REFERENCES `Auction` (`idAuction`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FeedbackUserId` FOREIGN KEY (`UserId`) REFERENCES `User` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `PersonalInfo`
--
ALTER TABLE `PersonalInfo`
  ADD CONSTRAINT `PersonalInfoIdUser` FOREIGN KEY (`idUser`) REFERENCES `User` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;
