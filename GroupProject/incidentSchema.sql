-- phpMyAdmin SQL Dump
-- version 3.3.7deb5build0.10.10.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 03, 2011 at 06:01 PM
-- Server version: 5.1.49
-- PHP Version: 5.3.3-1ubuntu9.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `incident`
--

-- --------------------------------------------------------

--
-- Table structure for table `coMeetings`
--

CREATE TABLE IF NOT EXISTS `coMeetings` (
  `meetID` int(11) NOT NULL AUTO_INCREMENT,
  `meetingTimeDate` datetime NOT NULL,
  `partyID` int(11) NOT NULL,
  `status` enum('A','C','H') NOT NULL DEFAULT 'A',
  PRIMARY KEY (`meetID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `coMeetings`
--

INSERT INTO `coMeetings` (`meetID`, `meetingTimeDate`, `partyID`, `status`) VALUES
(1, '2011-02-01 02:30:00', 1, 'A'),
(2, '2011-04-03 03:30:00', 1, 'A'),
(3, '2011-03-03 02:30:00', 1, 'A'),
(4, '2011-12-06 00:00:00', 2, 'H'),
(5, '2011-12-04 01:00:00', 2, 'H'),
(6, '2011-09-02 01:30:00', 5, 'A'),
(7, '2011-12-01 10:00:00', 3, 'H'),
(8, '2011-12-01 00:00:00', 9, 'H'),
(9, '2011-12-01 00:00:00', 9, 'H'),
(10, '2011-12-01 09:00:00', 12, 'A'),
(11, '2011-12-02 00:00:00', 11, 'A'),
(12, '2011-12-03 00:00:00', 8, 'A'),
(13, '2011-12-04 00:00:00', 4, 'C'),
(14, '2011-12-04 00:00:00', 17, 'H'),
(15, '2011-12-04 00:00:00', 18, 'H'),
(16, '2011-12-04 00:00:00', 16, 'H'),
(17, '2011-12-04 00:00:00', 15, 'H'),
(18, '2011-12-04 00:00:00', 14, 'H'),
(19, '2011-12-04 00:00:00', 13, 'H'),
(20, '2011-12-04 00:00:00', 19, 'H'),
(21, '2011-12-04 00:00:00', 20, 'H');

-- --------------------------------------------------------

--
-- Table structure for table `incidentParties`
--

CREATE TABLE IF NOT EXISTS `incidentParties` (
  `partyID` int(11) NOT NULL AUTO_INCREMENT,
  `incID` int(11) NOT NULL,
  `party` varchar(500) NOT NULL,
  `scheduled` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`partyID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `incidentParties`
--

INSERT INTO `incidentParties` (`partyID`, `incID`, `party`, `scheduled`) VALUES
(1, 17, 'anthony', 'Y'),
(2, 17, 'james', 'Y'),
(3, 17, 'asdf', 'Y'),
(4, 17, 'asdfhh', 'N'),
(5, 18, 'anthony pfaff\r', 'Y'),
(6, 18, 'eric holton\r', 'N'),
(7, 18, 'christopher mar\r', 'N'),
(8, 18, 'justin spurgeon', 'Y'),
(9, 19, 'eric\r', 'Y'),
(10, 19, 'anthony\r', 'N'),
(11, 19, 'chris', 'Y'),
(12, 20, 'ashok\r', 'Y'),
(13, 20, 'mario\r', 'Y'),
(14, 20, 'elizabeth', 'Y'),
(15, 21, 'test1\r', 'Y'),
(16, 21, 'test2', 'Y'),
(17, 22, 'test3\r', 'Y'),
(18, 22, 'test4', 'Y'),
(19, 23, 'mario', 'Y'),
(20, 24, 'mario', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `incidentReports`
--

CREATE TABLE IF NOT EXISTS `incidentReports` (
  `incID` int(11) NOT NULL AUTO_INCREMENT,
  `incidentTimeDate` datetime NOT NULL,
  `incidentSummary` varchar(7000) NOT NULL,
  PRIMARY KEY (`incID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `incidentReports`
--

INSERT INTO `incidentReports` (`incID`, `incidentTimeDate`, `incidentSummary`) VALUES
(1, '2011-11-07 18:40:30', 'testing'),
(4, '2001-01-01 00:00:00', 'adsfasdf'),
(3, '2001-01-01 00:00:00', 'asdfasdfsadf'),
(5, '2001-01-01 00:00:00', 'dfgdfgdfgsdfgsdfgsdfg\r\n\r\n\r\n10/9/2011'),
(6, '2001-01-01 00:00:00', 'stuff happened'),
(7, '2001-01-01 00:00:00', 'dfgdgdgdfgdfg'),
(8, '2011-07-01 00:00:00', 'they did stuff'),
(9, '2001-01-01 00:00:00', 'tyerset'),
(10, '2011-02-02 15:00:00', 'aasdfasdfasdf'),
(11, '2011-02-10 10:45:00', 'asdfasdfasdfsadfbbasdf'),
(12, '2011-02-10 10:45:00', 'asdfasdfasdfsadfbbasdf'),
(13, '2011-02-10 10:45:00', 'asdfasdfasdfsadfbbasdf'),
(14, '2011-09-19 04:15:00', 'sfdgdsfgdsfg'),
(15, '2011-09-19 04:15:00', 'sfdgdsfgdsfg'),
(16, '2011-09-19 04:15:00', 'sfdgdsfgdsfg'),
(17, '2011-09-19 04:15:00', 'sfdgdsfgdsfg'),
(18, '2011-11-02 00:30:00', 'jadsjfajdsfjadsfjadsf'),
(19, '2011-01-02 00:00:00', 'stuff happened'),
(20, '2011-11-16 01:15:00', 'stuff happened and it was bad.'),
(21, '2011-03-01 02:30:00', 'submitting IR'),
(22, '2011-02-04 03:30:00', 'asdfasdfasdf'),
(23, '2011-01-01 00:00:00', 'yea'),
(24, '2011-01-01 00:00:00', 'asdf');

-- --------------------------------------------------------

--
-- Table structure for table `meetingDocs`
--

CREATE TABLE IF NOT EXISTS `meetingDocs` (
  `docID` int(11) NOT NULL AUTO_INCREMENT,
  `meetingNotes` varchar(5000) NOT NULL,
  `partyID` int(11) NOT NULL,
  PRIMARY KEY (`docID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `meetingDocs`
--

INSERT INTO `meetingDocs` (`docID`, `meetingNotes`, `partyID`) VALUES
(1, 'asdfasdfasdfsadf', 2),
(2, '		', 2),
(3, 'adsfasdfadsf', 2),
(4, 'asdfasdfasdf		', 2),
(5, 'asdfasdfasdf		', 2),
(6, '		', 3),
(7, 'gasdgsdfasdfsdfasdfafsd', 9),
(8, 'asdfasdf', 17),
(9, 'testasdf', 18),
(10, 'yeah', 16),
(11, 'yeah', 15),
(12, '		', 14),
(13, 'asdf', 14),
(14, 'yeah', 13),
(17, 'asdfdsads', 19),
(18, '		', 20),
(19, '		', 19);

-- --------------------------------------------------------

--
-- Table structure for table `offenseResponsibility`
--

CREATE TABLE IF NOT EXISTS `offenseResponsibility` (
  `orID` int(11) NOT NULL AUTO_INCREMENT,
  `partyID` int(11) NOT NULL,
  `offenseID` int(11) NOT NULL,
  PRIMARY KEY (`orID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `offenseResponsibility`
--

INSERT INTO `offenseResponsibility` (`orID`, `partyID`, `offenseID`) VALUES
(1, 2, 1),
(2, 2, 2),
(3, 2, 3),
(4, 2, 1),
(5, 2, 2),
(6, 2, 3),
(7, 2, 1),
(8, 2, 2),
(9, 2, 3),
(10, 3, 3),
(11, 3, 4),
(12, 9, 6),
(13, 9, 8),
(14, 17, 1),
(15, 17, 2),
(16, 17, 6),
(17, 18, 8),
(18, 16, 7),
(19, 15, 4),
(20, 14, 1),
(21, 13, 1),
(22, 13, 2),
(26, 20, 8),
(25, 19, 1),
(27, 19, 1);

-- --------------------------------------------------------

--
-- Table structure for table `offenses`
--

CREATE TABLE IF NOT EXISTS `offenses` (
  `offenseID` int(11) NOT NULL AUTO_INCREMENT,
  `offenseName` varchar(500) NOT NULL,
  PRIMARY KEY (`offenseID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `offenses`
--

INSERT INTO `offenses` (`offenseID`, `offenseName`) VALUES
(1, 'Stalking'),
(2, 'Hazing'),
(3, 'Drug use/possession/paraphernalia'),
(4, 'Alcohol use/possession'),
(5, 'In presence of alcohol containers'),
(6, 'Assault'),
(7, 'Sexual offense'),
(8, 'Negligence');

-- --------------------------------------------------------

--
-- Table structure for table `partySanctions`
--

CREATE TABLE IF NOT EXISTS `partySanctions` (
  `partySanctionID` int(11) NOT NULL AUTO_INCREMENT,
  `partyID` int(11) NOT NULL,
  `sanctionID` int(11) NOT NULL,
  `dueDate` date NOT NULL,
  `completed` enum('Y','N') NOT NULL DEFAULT 'N',
  `notes` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`partySanctionID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `partySanctions`
--

INSERT INTO `partySanctions` (`partySanctionID`, `partyID`, `sanctionID`, `dueDate`, `completed`, `notes`) VALUES
(1, 18, 4, '2011-01-01', 'N', NULL),
(2, 16, 6, '2011-01-01', 'N', NULL),
(3, 2, 3, '2011-03-03', 'N', NULL),
(4, 15, 2, '2011-03-02', 'N', NULL),
(5, 14, 1, '2011-01-15', 'Y', 'yeh'),
(6, 13, 8, '2011-01-01', 'N', NULL),
(7, 19, 8, '2011-01-01', 'N', NULL),
(9, 20, 9, '0000-00-00', 'N', 'System generated suspension as a result of being found responsible while on probation.'),
(10, 19, 9, '0000-00-00', 'N', 'System generated suspension as a result of being found responsible while on probation.'),
(11, 19, 10, '0000-00-00', 'N', 'System generated expulsion as a result of being found responsible while on suspension.');

-- --------------------------------------------------------

--
-- Table structure for table `sanctions`
--

CREATE TABLE IF NOT EXISTS `sanctions` (
  `sanctionID` int(11) NOT NULL AUTO_INCREMENT,
  `sanctionName` varchar(500) NOT NULL,
  `sanctionType` enum('E','P') NOT NULL DEFAULT 'E',
  PRIMARY KEY (`sanctionID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `sanctions`
--

INSERT INTO `sanctions` (`sanctionID`, `sanctionName`, `sanctionType`) VALUES
(1, 'Marijuana class', 'E'),
(2, 'Alcohol class', 'E'),
(3, 'Other drugs class', 'E'),
(4, 'Community service', 'E'),
(5, 'Research paper', 'E'),
(6, 'Written apology', 'E'),
(7, 'Financial restitution', 'E'),
(8, 'Probation', 'P'),
(9, 'Suspension', 'P'),
(10, 'Expulsion', 'P');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userLogin` varchar(20) NOT NULL,
  `userPasswordHash` varchar(512) NOT NULL,
  `userRole` enum('RA','JA','CO') NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `userLogin`, `userPasswordHash`, `userRole`) VALUES
(1, 'pfaffaw', '30f3b534473379b7bdd0a1ed347d3e72003c7c12', 'CO'),
(8, 'co', '87dda20416649f2a6a1b03d4e13d48a80b1a357f', 'CO'),
(7, 'ra', 'fb2b9eca64fdf06848a11b0636ff4e92ac288d06', 'RA'),
(6, 'ja', '84572ef2253ef81e2d8cd8c65849f4d9a3881f47', 'JA');
