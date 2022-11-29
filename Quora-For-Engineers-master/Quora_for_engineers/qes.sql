-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2022 at 06:26 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qes`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getques` (IN `uname` INT)   BEGIN
SELECT * FROM QUES;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ans`
--

CREATE TABLE `ans` (
  `QID` int(11) DEFAULT NULL,
  `ANSWER` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ans`
--

INSERT INTO `ans` (`QID`, `ANSWER`) VALUES
(9, 'the practice of using a network of remote servers hosted on the internet to store, manage, and process data, rather than a local server or a personal computer.'),
(9, 'Cloud computing is the on-demand delivery of IT resources over the Internet with pay-as-you-go pricing. Instead of buying, owning, and maintaining physical data centers and servers, you can access technology services, such as computing power, storage, and databases, on an as-needed basis from a cloud provider like Amazon Web Services (AWS).'),
(10, 'Structured data is the data which conforms to a data model, has a well define structure, follows a consistent order and can be easily accessed and used by a person or a computer program.  Structured data is usually stored in well-defined schemas such as Databases. It is generally tabular with column and rows that clearly define its attributes.'),
(10, 'Structured data is when data is in a standardized format, has a well-defined structure, complies to a data model, follows a persistent order, and is easily accessed by humans and programs. This data type is generally stored in a database.'),
(11, 'Big data analytics is the use of advanced analytic techniques against very large, diverse data sets that include structured, semi-structured and unstructured data, from different sources, and in different sizes from terabytes to zettabytes.'),
(11, 'Big data analytics is the process of collecting, examining, and analyzing large amounts of data to discover market trends, insights, and patterns that can help companies make better business decisions. This information is available quickly and efficiently so that companies can be agile in crafting plans to maintain their competitive advantage.'),
(12, 'a hybrid of front end and back end development. Full stack can apply to a web stack, mobile stack, or a native application stack (i.e. software programs for specific devices)'),
(12, 'Full stack development refers to the combined end-to-end process of developing a web application or website, including both the front-end and the back-end.');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `fid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback`, `username`, `fid`) VALUES
('Nice application', 'rishabh@gmail.com', 4);

-- --------------------------------------------------------

--
-- Table structure for table `greviances`
--

CREATE TABLE `greviances` (
  `username` varchar(30) NOT NULL,
  `subject` varchar(30) NOT NULL,
  `greviance` varchar(100) NOT NULL,
  `gid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `greviances`
--

INSERT INTO `greviances` (`username`, `subject`, `greviance`, `gid`) VALUES
('rishabh@gmail.com', 'Answer time', 'What is the expected time for my question to get answered', 4);

-- --------------------------------------------------------

--
-- Table structure for table `ques`
--

CREATE TABLE `ques` (
  `question` varchar(200) NOT NULL,
  `uname` varchar(30) NOT NULL,
  `qid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ques`
--

INSERT INTO `ques` (`question`, `uname`, `qid`) VALUES
('what is cloud computing?', 'ryan@gmail.com', 9),
('What is structured data?', 'ryan@gmail.com', 10),
('What is big data analytics?', 'ryan@gmail.com', 11),
('What is Full stack development?', 'ryan@gmail.com', 12);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`fname`, `lname`, `username`, `password`) VALUES
('Rishabh', 'Dubey', 'rishabh@gmail.com', 'Rishabh@123'),
('Ryan', 'Taylor', 'ryan@gmail.com', 'Tailor@345'),
('Tyson ', 'Fury', 'tyson@gmail.com', 'Tyson@234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ans`
--
ALTER TABLE `ans`
  ADD KEY `QID` (`QID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`fid`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `greviances`
--
ALTER TABLE `greviances`
  ADD PRIMARY KEY (`gid`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `ques`
--
ALTER TABLE `ques`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `greviances`
--
ALTER TABLE `greviances`
  MODIFY `gid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ques`
--
ALTER TABLE `ques`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ans`
--
ALTER TABLE `ans`
  ADD CONSTRAINT `ans_ibfk_1` FOREIGN KEY (`QID`) REFERENCES `ques` (`qid`),
  ADD CONSTRAINT `ans_ibfk_2` FOREIGN KEY (`QID`) REFERENCES `ques` (`qid`) ON DELETE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `greviances`
--
ALTER TABLE `greviances`
  ADD CONSTRAINT `greviances_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
