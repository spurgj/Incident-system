-- phpMyAdmin SQL Dump
-- version 3.3.7deb5build0.10.10.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 15, 2011 at 09:02 PM
-- Server version: 5.1.49
-- PHP Version: 5.3.3-1ubuntu9.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `coMeetings`
--

INSERT INTO `coMeetings` (`meetID`, `meetingTimeDate`, `partyID`, `status`) VALUES
(1, '2011-02-01 02:30:00', 1, 'A'),
(2, '2011-04-03 03:30:00', 1, 'A'),
(3, '2011-03-03 02:30:00', 1, 'A'),
(4, '2011-12-06 00:00:00', 2, 'H'),
(5, '2011-12-04 01:00:00', 2, 'H'),
(6, '2011-09-02 01:30:00', 5, 'A');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `incidentParties`
--

INSERT INTO `incidentParties` (`partyID`, `incID`, `party`, `scheduled`) VALUES
(1, 17, 'anthony', 'Y'),
(2, 17, 'james', 'Y'),
(3, 17, 'asdf', 'N'),
(4, 17, 'asdfhh', 'N'),
(5, 18, 'anthony pfaff\r', 'Y'),
(6, 18, 'eric holton\r', 'N'),
(7, 18, 'christopher mar\r', 'N'),
(8, 18, 'justin spurgeon', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `incidentReports`
--

CREATE TABLE IF NOT EXISTS `incidentReports` (
  `incID` int(11) NOT NULL AUTO_INCREMENT,
  `incidentTimeDate` datetime NOT NULL,
  `incidentSummary` varchar(7000) NOT NULL,
  PRIMARY KEY (`incID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

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
(18, '2011-11-02 00:30:00', 'jadsjfajdsfjadsfjadsf');

-- --------------------------------------------------------

--
-- Table structure for table `meetingDocs`
--

CREATE TABLE IF NOT EXISTS `meetingDocs` (
  `docID` int(11) NOT NULL AUTO_INCREMENT,
  `meetingNotes` varchar(5000) NOT NULL,
  `partyID` int(11) NOT NULL,
  PRIMARY KEY (`docID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `meetingDocs`
--

INSERT INTO `meetingDocs` (`docID`, `meetingNotes`, `partyID`) VALUES
(1, 'asdfasdfasdfsadf', 2),
(2, '		', 2),
(3, 'adsfasdfadsf', 2),
(4, 'asdfasdfasdf		', 2),
(5, 'asdfasdfasdf		', 2);

-- --------------------------------------------------------

--
-- Table structure for table `offenseResponsibility`
--

CREATE TABLE IF NOT EXISTS `offenseResponsibility` (
  `orID` int(11) NOT NULL AUTO_INCREMENT,
  `partyID` int(11) NOT NULL,
  `offenseID` int(11) NOT NULL,
  PRIMARY KEY (`orID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

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
(9, 2, 3);

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