-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2024 at 03:02 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sspl2`
--

-- --------------------------------------------------------

--
-- Table structure for table `allocated_batch`
--

CREATE TABLE `allocated_batch` (
  `id` int(11) NOT NULL,
  `enid` int(11) NOT NULL,
  `bid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `allocated_batch`
--

INSERT INTO `allocated_batch` (`id`, `enid`, `bid`) VALUES
(14, 0, 13),
(15, 0, 14),
(18, 10, 15),
(19, 11, 16),
(22, 12, 16),
(27, 24, 18),
(28, 23, 18),
(30, 22, 18),
(33, 26, 18),
(34, 25, 18),
(36, 21, 18),
(39, 20, 18),
(43, 19, 18),
(48, 18, 18),
(54, 17, 18),
(61, 35, 18),
(62, 34, 18),
(63, 33, 18),
(64, 32, 18),
(65, 32, 18),
(66, 31, 18),
(67, 31, 18),
(68, 31, 18),
(69, 30, 18),
(70, 30, 18),
(71, 30, 18),
(72, 30, 18),
(73, 29, 18),
(74, 29, 18),
(75, 29, 18),
(76, 29, 18),
(77, 29, 18),
(78, 28, 18),
(79, 28, 18),
(80, 28, 18),
(81, 28, 18),
(82, 28, 18),
(83, 28, 18),
(84, 27, 15);

-- --------------------------------------------------------

--
-- Table structure for table `applied_jobs`
--

CREATE TABLE `applied_jobs` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `resume` varchar(200) NOT NULL,
  `marksheet` varchar(200) NOT NULL,
  `adhar_card` varchar(200) NOT NULL,
  `leaving_certificate` varchar(200) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '-1: rejected\r\n0: pending\r\n1:selected\r\n2:joined',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applied_jobs`
--

INSERT INTO `applied_jobs` (`id`, `branch_id`, `job_id`, `student_id`, `resume`, `marksheet`, `adhar_card`, `leaving_certificate`, `status`, `created_at`, `updated_at`) VALUES
(101, 9, 7, 1886, 'Abhishek.doc', 'marksheet.doc', 'adhar.jpeg', 'lcertificate.jpeg', 2, '2024-05-08 06:47:51', '2024-05-08 07:50:07'),
(102, 9, 7, 1887, 'resume.doc', 'marksheet.doc', 'adhar.jpeg', 'lcertificate.jpeg', 1, '2024-05-08 07:50:46', '2024-05-08 07:54:37'),
(103, 9, 7, 1888, 'resume.doc', 'marksheet.doc', 'adhar.jpeg', 'lcertificate.jpeg', 0, '2024-05-08 07:53:03', '2024-05-08 07:53:03'),
(104, 9, 7, 1889, 'resume.doc', 'marksheet.doc', 'adhar.jpeg', 'lcertificate.jpeg', -1, '2024-05-08 07:54:19', '2024-05-08 07:54:19'),
(105, 9, 8, 1888, 'resume.doc', 'marksheet.doc', 'adhar.jpeg', 'lcertificate.jpeg', 0, '2024-05-08 07:55:48', '2024-05-08 07:55:48'),
(106, 8, 8, 1889, 'resume.doc', 'marksheet.doc', 'adhar.jpeg', 'lcertificate.jpeg', 1, '2024-05-08 07:56:52', '2024-05-08 07:56:52'),
(107, 8, 8, 1889, 'resume.doc', 'marksheet.doc', 'adhar.jpeg', 'lcertificate.jpeg', 2, '2024-05-08 07:58:02', '2024-05-08 07:58:02'),
(108, 9, 8, 1889, 'resume.doc', 'marksheet.doc', 'adhar.jpeg', 'lcertificate.jpeg', -1, '2024-05-08 07:58:52', '2024-05-08 07:58:52');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `user_type` int(11) NOT NULL DEFAULT 0 COMMENT '0:student\r\n1:staff',
  `date` date NOT NULL,
  `status` int(11) NOT NULL COMMENT '0: absent\r\n1: prasent\r\n2: on-leave\r\n3: holidy',
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  `duration` varchar(50) NOT NULL,
  `late_by` time DEFAULT NULL,
  `early_by` time DEFAULT NULL,
  `ot` time DEFAULT NULL,
  `shift` int(11) DEFAULT NULL COMMENT '0:general shift\r\n1:night shift\r\n2: day shift',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `user_id`, `batch_id`, `user_type`, `date`, `status`, `in_time`, `out_time`, `duration`, `late_by`, `early_by`, `ot`, `shift`, `created_at`, `updated_at`) VALUES
(32, 1889, NULL, 1, '2024-05-07', 1, '10:56:00', '14:56:00', '04:00:00', '00:00:00', '00:00:00', '00:00:00', 0, '2024-05-07 05:26:24', '2024-05-07 05:26:24');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_value`
--

CREATE TABLE `attribute_value` (
  `id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `attribute_parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE `batch` (
  `id` int(11) NOT NULL,
  `batch_id` varchar(255) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `batch_name` varchar(255) NOT NULL,
  `batch_time` varchar(255) NOT NULL,
  `batch_start` date NOT NULL,
  `batch_end` date NOT NULL,
  `progress` int(11) NOT NULL DEFAULT 1,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`id`, `batch_id`, `project_id`, `course_id`, `batch_name`, `batch_time`, `batch_start`, `batch_end`, `progress`, `location`) VALUES
(18, 'BHID17', 12, 62, 'J41', '14:00', '2024-03-04', '2024-07-20', 10, 'Pune'),
(19, 'BHID18', 12, 62, 'J42', '11:00', '2024-04-10', '2024-07-31', 1, 'Pune'),
(20, 'BHID19', 12, 62, 'J43', '18:26', '2024-04-16', '2024-07-31', 1, 'Pune');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `duration_in_months` varchar(15) NOT NULL,
  `duration_in_hours` varchar(15) NOT NULL,
  `added_by` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `project_id`, `name`, `duration_in_months`, `duration_in_hours`, `added_by`, `active`, `created_at`, `updated_at`) VALUES
(58, 9, 'Software Testing', '4 month', '300 hours', 1, 1, '2024-04-02 11:23:35', '2024-04-03 11:46:47'),
(60, 12, 'Full Stack Java Developer', '4 Months', '300 Hours', 1, 1, '2024-04-03 11:47:18', '2024-04-03 11:48:45'),
(61, 9, 'Full Stack Java Developer', '4 Months', '300 Hours', 1, 1, '2024-04-03 11:47:58', '2024-04-03 11:48:52'),
(62, 12, 'Software Testing', '4 Months', '300 Hours', 1, 1, '2024-04-03 11:48:36', '2024-04-03 11:48:59'),
(63, 11, 'Machine Learning Engineer', '4 Months', '300 Hours', 1, 1, '2024-04-03 11:49:23', '2024-04-03 11:49:23'),
(64, 11, 'Data Associate', '4 Months', '300 Hours', 1, 1, '2024-04-03 11:49:40', '2024-04-03 11:49:40'),
(65, 11, 'RPA Developer', '4 Months', '300 Hours', 1, 1, '2024-04-03 11:49:59', '2024-04-03 11:49:59'),
(66, 11, 'Dot Net Developer', '4 Months', '300 Hours', 1, 1, '2024-04-03 11:50:23', '2024-04-03 11:50:23'),
(67, 11, 'PHP Developer', '4 Months', '300 Hours', 1, 1, '2024-04-03 11:50:46', '2024-04-03 11:50:46'),
(69, 10, 'DAME', '36 Months', '', 1, 1, '2024-04-03 11:52:09', '2024-04-03 11:52:09'),
(70, 13, 'DMA', '24 Months', '', 1, 1, '2024-04-03 11:52:28', '2024-04-03 11:52:28'),
(71, 13, 'DAME', '36 Months', '', 1, 1, '2024-04-03 11:52:52', '2024-04-03 11:52:52'),
(72, 14, 'DMA', '24 Months', '', 1, 1, '2024-04-03 11:53:08', '2024-04-03 11:53:08'),
(73, 14, 'DME', '24 Months', '', 1, 1, '2024-04-03 11:53:21', '2024-04-03 11:53:21'),
(75, 10, 'DMA', '', '', 1, 1, '2024-04-04 09:18:07', '2024-04-29 10:50:42');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `active`) VALUES
(5, 'Virtual', 1);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `service_charge_value` varchar(255) NOT NULL,
  `vat_charge_value` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `currency` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1: Grade 1\r\n2: Grade 2\r\n3: Grade 3\r\n4: Assessment 1\r\n5: Assessment 2\r\n6: Assessment 3\r\n7: Event\r\n8: Project Docs\r\n9: Other',
  `document` varchar(1000) NOT NULL,
  `added_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `batch_id`, `subject_id`, `title`, `type`, `document`, `added_by`, `created_at`, `updated_at`) VALUES
(4, 18, 56, 'Testing other document', 9, 'C:/xampp/htdocs/sspl2/assets/uploads/documents/9_type/Kiran_Kiran/2888087.png', 1890, '2024-05-09 12:54:40', '2024-05-09 12:54:40'),
(5, 18, 56, 'Testing Study Material', 10, 'C:/xampp/htdocs/sspl2/assets/uploads/documents/10_type/Kiran_Kiran/936c6248817528c7bc2f735fc5205ac5.jpg', 1890, '2024-05-09 12:55:45', '2024-05-09 12:55:45');

-- --------------------------------------------------------

--
-- Table structure for table `enquiry`
--

CREATE TABLE `enquiry` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `counseller_id` int(11) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `student_address` varchar(500) NOT NULL,
  `student_mobile` bigint(20) NOT NULL,
  `student_email` varchar(200) NOT NULL,
  `gender` int(11) NOT NULL DEFAULT 1 COMMENT '0: Female, 1: Male, 2: Other',
  `qualification` varchar(100) NOT NULL,
  `specialization` varchar(100) NOT NULL,
  `college_name` varchar(500) NOT NULL,
  `status` varchar(50) NOT NULL,
  `remark` varchar(50) NOT NULL,
  `isTestSubmited` int(11) NOT NULL COMMENT '0:not test sudmited\r\n1: test submited',
  `added_by` int(11) NOT NULL,
  `next_follow_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enquiry`
--

INSERT INTO `enquiry` (`id`, `project_id`, `course_id`, `counseller_id`, `student_name`, `student_address`, `student_mobile`, `student_email`, `gender`, `qualification`, `specialization`, `college_name`, `status`, `remark`, `isTestSubmited`, `added_by`, `next_follow_date`, `created_at`, `updated_at`) VALUES
(1, 12, 62, 1884, 'Gayatri Karande', 'Vidhyanagar, Karad 415124', 9545720498, 'karandegayatri393@gmail.com', 1, 'B.SC. CS', 'CS', 'Sadguru Gadage Maharaj College, Karad', 'Confirm', 'abc', 0, 1, NULL, '2024-04-09 18:30:00', '2024-05-10 11:06:01'),
(2, 9, 60, 1887, 'Manav Chatale', 'Pune', 917262289, 'manavchatale@gmail.com', 1, 'BBA(CA)', 'Computer', 'D.Y.Patil', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-04-24 06:21:43', '2024-05-04 10:33:43'),
(3, 9, 60, 1887, 'Vhankade  Vaibhav', 'Pune', 9370146299, 'vkade@gmail.com', 1, 'B.E.(Computer)', 'Computer', 'D.Y.Patil', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-04-24 06:30:48', '2024-05-04 10:33:43'),
(4, 9, 60, 1884, 'Sunil Singh', 'Pume', 6009698008, 'SunilS@gmail.com', 1, 'BBA CA', 'Computer Application', 'Modern College', 'Confirm', 'Proceed for Test', 1, 1884, NULL, '2024-04-24 06:31:45', '2024-05-04 10:33:43'),
(5, 9, 60, 1884, 'Siddesh', 'Pune', 9561611609, 'siddheshks@gmail.com', 1, 'BBA CA', 'BBA CA', 'Modern College', 'Next-date', 'Proceed for Test', 1, 1884, NULL, '2024-04-24 06:35:03', '2024-05-04 10:33:43'),
(6, 9, 60, 1887, 'Bharaskar Sneha', 'Pune', 9578545972, 'bsneha@gmail.com', 1, 'BBA(CA)', 'Computer Application', 'Annasaheb Magar Mahavidyalaya Hadapsar Pune', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-04-24 06:38:49', '2024-05-04 10:33:43'),
(7, 9, 60, 1884, 'Mangesh Murshetwar', 'Pune', 7517034352, 'Mangeshmr@gmail.com', 1, 'BBA. CA', 'BBA. CA', 'Dr. D.Y. Patil IOT', 'Next-date', 'Proceed for Test', 1, 1884, NULL, '2024-04-24 06:40:40', '2024-05-04 10:33:43'),
(8, 9, 60, 1884, 'Radha Chavan', 'Pune', 8459233767, 'radha.g.chavan@gmail.com', 1, 'B.tech', 'CS', 'Sinhgad College of Engg.', 'Next-date', 'Proceed for Test', 1, 1884, NULL, '2024-04-24 06:42:53', '2024-05-04 10:33:43'),
(9, 9, 60, 1887, 'Gaikwad Sakshi', 'Pune', 9070397052, 'gs@gmail.com', 1, 'BBA(CA)', 'CA', 'Annasaheb Magar Mahavidyalaya, Hadpsar, Pune', 'Confirm', 'Confirm', 0, 1887, NULL, '2024-04-24 06:44:13', '2024-05-04 10:33:43'),
(10, 9, 60, 1884, 'Shruti Gunjkar', 'Pune', 9175107123, 'shruti.s.gunjkar@gmail.com', 1, 'BBA. CA', 'BBA. CA', 'Sinhgad College of Engg.', 'Next-date', 'Proceed for test', 1, 1884, NULL, '2024-04-24 06:44:45', '2024-05-04 10:33:43'),
(11, 9, 60, 1884, 'Aman Dhage', 'Pune', 9823686674, 'aman.s.dhage@gmail.com', 1, 'BBA.CA', 'BBA.CA', 'Modern College of Arts, Science & Commerce', 'Next-date', 'Proceed for Test', 0, 1884, NULL, '2024-04-24 06:51:46', '2024-05-04 10:33:43'),
(12, 9, 60, 1884, 'Reshma Jagtap', 'Pune', 8669293870, 'jagtapr@gmail.com', 1, 'MCA', 'CS', 'PES College of Engg.', 'Next-date', 'Proceed for Test', 0, 1884, NULL, '2024-04-24 06:55:22', '2024-05-04 10:33:43'),
(13, 9, 60, 1887, 'Jawale Saurabh', 'Pune', 9156875998, 'jawales@gmail.com', 1, 'BBA(CA)', 'CA', 'Sahyadri Valley College Of Engineering & Technology', 'Confirm', 'Confirm', 0, 1887, NULL, '2024-04-24 06:58:44', '2024-05-04 10:33:43'),
(14, 9, 60, 1884, 'Kalash Jain', 'Pune', 9096772108, 'kalash.jain@gmail.com', 1, 'BBA.CA', 'BBA.CA', 'Modern College of Engg.', 'Next-date', 'Proceed For Test', 0, 1884, NULL, '2024-04-24 07:00:41', '2024-05-04 10:33:43'),
(15, 9, 60, 1884, 'Ashwin Borhade', 'Pune', 9145482039, 'ashwinborhade@gmail.com', 1, 'BBA.CA', 'CA', 'Modern College of Engg.', 'Next-date', 'Proceed for Test', 0, 1884, NULL, '2024-04-24 07:03:42', '2024-05-04 10:33:43'),
(16, 9, 60, 1887, 'Rahul Kananboina', 'Pune', 8767498743, 'rk@gmai.com', 1, 'BBA(CA)', 'Computer Application', 'G.S.MOZE COLLEGE OF ENGINEERING PUNE', 'Confirm', 'Confirm', 0, 1887, NULL, '2024-04-24 07:03:45', '2024-05-04 10:33:43'),
(17, 9, 60, 1887, 'Ashwin Unnikrishnan', 'Pune', 9495390856, 'akrishnan@gmail.com', 1, 'BBA(CA)', 'Computer Application', 'G.S.MOZE COLLEGE OF ENGINEERING PUNE', 'Confirm', 'Confirm', 0, 1887, NULL, '2024-04-24 07:09:16', '2024-05-04 10:33:43'),
(18, 9, 60, 1884, 'Tanushree Jadhav', 'Pune', 8421953261, 'jadhavtanushree@gmail.com', 1, 'BBA. CA', 'CA', 'Sinhgad College', 'Next-date', 'Proceed for test', 0, 1884, NULL, '2024-04-24 07:09:19', '2024-05-04 10:33:43'),
(19, 9, 60, 1884, 'Chaitrali Badave', 'Pune', 8788899565, 'chaitralib@gmail.com', 1, 'BBA.CA', 'CA', 'Modern College', 'Next-date', 'Proceed For Test', 0, 1884, NULL, '2024-04-24 07:10:43', '2024-05-04 10:33:43'),
(20, 9, 60, 1887, 'Sandhya Kaisar', 'Pune', 9604696020, 'skaisar@gmail.com', 1, 'BBA(CA)', 'Computer Application', 'G.S.MOZE COLLEGE OF ENGINEERING PUNE', 'Confirm', 'Confirm', 0, 1887, NULL, '2024-04-24 07:11:09', '2024-05-04 10:33:43'),
(21, 9, 60, 1887, 'Shobha Chavan', 'Pune', 9604608122, 'schavan@gmail.com', 1, 'BBA(CA)', 'Computer Application', 'G.S.MOZE COLLEGE OF ENGINEERING PUNE', 'Next-date', 'Will Come tomorrow', 0, 1887, NULL, '2024-04-24 07:14:25', '2024-05-04 10:33:43'),
(22, 9, 60, 1887, 'Vaibhav Barade', 'Pune', 7722049556, 'vbarade@gmail.com', 1, 'BBA(CA)', 'Computer Application', 'G.S.MOZE COLLEGE OF ENGINEERING PUNE', 'Next-date', 'Will Come tomorrow', 0, 1887, NULL, '2024-04-24 07:16:07', '2024-05-04 10:33:43'),
(23, 9, 60, 1884, 'Pankaj Harabhav', 'Pune', 9272163149, 'pankajh@gmail.com', 1, 'BBA.CA', 'CA', 'Abasaheb Garware College', 'Next-date', 'Proceed for Test', 0, 1884, NULL, '2024-04-24 07:16:51', '2024-05-04 10:33:43'),
(24, 9, 60, 1884, 'Raviraj Kanse', 'Pune', 8668902029, 'kanse.r@gmail.com', 1, 'BBA.CA', 'CA', 'Modern College of Engg.', 'Next-date', 'Proceed for Test', 0, 1884, NULL, '2024-04-24 07:18:30', '2024-05-04 10:33:43'),
(25, 9, 60, 1887, 'Atharva Gupta', 'Pune', 9028661689, 'agupta@gmail.com', 1, 'BBA(CA)', 'Computer Application', 'G.S.MOZE COLLEGE OF ENGINEERING PUNE', 'Next-date', 'Will Come tomorrow', 0, 1887, NULL, '2024-04-24 07:18:42', '2024-05-04 10:33:43'),
(26, 9, 60, 1884, 'Vishwajeet Patil', 'Pune', 8010815386, 'vishwajeet.patil@gmail.com', 1, 'BBA.CA', 'CA', 'P.E.S. Modern College of Engg.', 'Next-date', 'Proceed for Test', 0, 1884, NULL, '2024-04-24 07:20:25', '2024-05-04 10:33:43'),
(27, 9, 60, 1884, 'Sneha Chopate', 'Pune', 9359830838, 'chopate.sneha@gmail.com', 1, 'B.Sc. CS', 'CS', 'Modern College of Arts, Science & Commerce', 'Next-date', 'Proceed for Test', 0, 1884, NULL, '2024-04-24 07:22:49', '2024-05-04 10:33:43'),
(28, 9, 60, 1884, 'Karuna Gorad', 'Pune', 8482892188, 'gorad.karuna@gmail.com', 1, 'BBA. CA', 'CA', 'Modern College of Arts, Science & Commerce', 'Next-date', 'Proceed For Test', 0, 1884, NULL, '2024-04-24 07:24:40', '2024-05-04 10:33:43'),
(29, 9, 60, 1884, 'Pratik Wable', 'Pune', 8262805959, 'wable.pratik@gmail.com', 1, 'BBA. CA', 'CA', 'Modern College of Arts, Science & Commerce', 'Next-date', 'Proceed for Test', 0, 1884, NULL, '2024-04-24 07:30:22', '2024-05-04 10:33:43'),
(30, 9, 60, 1884, 'Anshul Patre', 'Pune', 9370592233, 'patre.anshul@gmail.com', 1, 'B.E. CSE', 'CS', 'Modern College of Arts, Science & commerce', 'Next-date', 'Proceed for test', 0, 1884, NULL, '2024-04-24 07:31:56', '2024-05-04 10:33:43'),
(31, 9, 60, 1884, 'Shubham Siddha', 'Pune', 7796034567, 'shubham.s@gmail.com', 1, 'BBA. CA', 'CA', 'Sinhgad College of Engg.', 'Next-date', 'Proceed for Test', 0, 1884, NULL, '2024-04-24 07:33:54', '2024-05-04 10:33:43'),
(32, 9, 60, 1884, 'Ashish Shinde', 'Pune', 9325483879, 'ashish.shinde4@gmail.com', 1, 'BE. CS', 'CS', 'Sir Parshurambhau College', 'Next-date', 'Proceed for Test', 0, 1884, NULL, '2024-04-24 07:38:21', '2024-05-04 10:33:43'),
(33, 9, 60, 1884, 'Amit Gavali', 'Pune', 77450493893, 'amit.g@gmail.com', 1, 'BE. CS', 'CS', 'Sir Parshurambhau College', 'Next-date', 'Proceed for Test', 0, 1884, NULL, '2024-04-24 07:40:00', '2024-05-04 10:33:43'),
(34, 9, 60, 1884, 'Aditi Gole', 'Pune', 7350257610, 'aditi.gole@gmail.com', 1, 'BCA', 'CS', 'Abasaheb Garware College', 'Next-date', 'Proceed for Test', 0, 1884, NULL, '2024-04-24 07:42:18', '2024-05-04 10:33:43'),
(35, 9, 60, 1884, 'Sakshi Jadhav', 'Pune', 8767842192, 'jadhav.s@gmail.com', 1, 'BBA. CA', 'CS', 'Modern College of Engg.', 'Next-date', 'Proceed for test', 0, 1884, NULL, '2024-04-24 07:44:01', '2024-05-04 10:33:43'),
(36, 9, 60, 1884, 'Yogesh Ghodke', 'Pune', 9960372783, 'yogesh.ghodke@gmail.com', 1, 'BE', 'CS', 'Sinhgad College of Engg.', 'Next-date', 'Proceed for Test', 0, 1884, NULL, '2024-04-24 07:45:53', '2024-05-04 10:33:43'),
(37, 9, 60, 1887, 'Ranjit Sonawane', 'Pune', 7768067207, 'rsonawane@gmail.com', 1, 'MCA', 'Computer', 'Sahyadri Valley College Of Engineering & Technology', 'Confirm', 'Confirm', 0, 1887, NULL, '2024-04-24 07:46:47', '2024-05-04 10:33:43'),
(38, 9, 60, 1887, 'Kunal Sureshchand Rathore', 'Pune', 9373787528, 'srathore@gmail.com', 1, 'B.Tech', 'IT', 'Annasaheb Magar Mahavidyalaya, Hadpsar, Pune', 'Confirm', 'Confirm', 0, 1887, NULL, '2024-04-24 07:53:26', '2024-05-04 10:33:43'),
(39, 9, 60, 1887, 'Shobha Chavan', 'Pune', 9604608122, 'schavan@gmail.com', 1, 'BBA(CA)', 'Computer', 'Annasaheb Magar Mahavidyalaya, Hadpsar, Pune', 'Confirm', 'Confirm', 0, 1887, NULL, '2024-04-24 07:56:13', '2024-05-04 10:33:43'),
(40, 9, 60, 1884, 'Ashvini Surwase', 'Pune', 8767443946, 'ashvini.surwase@gmail.com', 1, 'BE', 'CS', 'PES Modern College', 'Next-date', 'Proceed for Test', 0, 1884, NULL, '2024-04-24 07:57:18', '2024-05-04 10:33:43'),
(41, 9, 60, 1887, 'Saurabh Jawale', 'Pune', 9156875998, 'jawales@gmail.com', 1, 'BBA(CA)', 'Computer', 'Annasaheb Magar Mahavidyalaya, Hadpsar, Pune', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-04-24 07:57:27', '2024-05-07 07:49:02'),
(42, 9, 60, 1887, 'Shruti Chaudhari', 'Pune', 9325057785, 'schaudhari@gmail.com', 1, 'BBA(CA)', 'Computer', 'Annasaheb Magar Mahavidyalaya, Hadpsar, Pune', 'Confirm', 'Confirm', 0, 1887, NULL, '2024-04-24 08:10:34', '2024-05-04 10:33:43'),
(43, 9, 61, 1887, 'Sakshi Sadhave', 'Pune', 8767842192, 'ss@gmail.com', 1, 'BBA(CA)', 'Computer', 'Annasaheb Magar Mahavidyalaya, Hadpsar, Pune', 'Confirm', 'Confirm', 0, 1887, NULL, '2024-04-24 08:12:25', '2024-05-04 10:33:43'),
(44, 9, 61, 1887, 'Prachi Kudale', 'Pune', 7620703051, 'kudaleprachi@gmail.com', 1, 'BBA(CA)', 'Computer', 'Annasaheb Magar Mahavidyalaya, Hadpsar, Pune', 'Confirm', 'Confirm', 0, 1887, NULL, '2024-04-24 08:14:28', '2024-05-04 10:33:43'),
(45, 9, 60, 1887, 'Abhishek Sawale', 'Pune', 9022852787, 'as@gmail.com', 1, 'B.E', 'Computer', 'Modern College of Business Administration Campus Shivaji Nagar Pune', 'Confirm', 'Confirm', 0, 1887, NULL, '2024-04-24 08:18:08', '2024-05-04 10:33:43'),
(46, 9, 60, 1887, 'Vaishnavi', 'Pune', 9145386363, 'vz@gmail.com', 1, 'BBA(CA)', 'Computer', 'Modern College of Business Administration Campus Shivaji Nagar Pune', 'Next-date', 'Will come tomorrow', 0, 1887, NULL, '2024-04-24 08:21:53', '2024-05-04 10:33:43'),
(47, 9, 60, 1887, 'Shivam', 'Pune', 9022265339, 'sp@gmail.com', 1, 'BBA(CA)', 'Computer', 'Modern College of Business Administration Campus Shivaji Nagar Pune', 'Next-date', 'Will come tomorrow', 0, 1887, NULL, '2024-04-24 08:23:08', '2024-05-04 10:33:43'),
(48, 9, 60, 1887, 'Shruti Naval Bhosale', 'Phurshungi ShriRamSwapnpurti Society B wing flat no-403 Hadapsar Pune', 9356717412, 'shrutibhosale2323@gmail.com', 1, 'BCA', 'Computer', 'S.M.Joshi Arts,Science & Commerce college HADAPSAR Pune.', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-04-24 11:16:59', '2024-05-04 10:33:43'),
(49, 9, 60, 1887, 'Aniket Amrutrao Yadav', 'Hadapsar Gadital Pune-411028', 7758908367, 'yaniket217@gmail.com', 1, 'MSC', 'Computer Science', 'S.M.Joshi College Hadapsar Pune', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-04-24 11:43:13', '2024-05-04 10:33:43'),
(50, 9, 60, 1887, 'Pratiksha Datta Nilewar', 'Naded City', 8669414010, 'pratikshanilewar58@gmail.com', 1, 'B.Tech', 'Computer Science Engineering', 'Shri Guru Gobind Singh Ji Institute of Engineering of Technology Naded (Swami Ramanand Teerth Marathwada University)', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-04-24 12:07:27', '2024-05-04 10:33:43'),
(51, 9, 60, 1887, 'Sujit Haribhau Godage', 'GangaNagar Hadapsar Pune', 7028044385, 'sujitgodage2558@gmail.com', 1, 'BSC', 'Computer Science', 'Shri Shivaji Mahavidyalaya, Paranda -413502', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-04-24 12:20:19', '2024-05-04 10:33:43'),
(52, 9, 60, 1887, 'Sushant Tanaji Patil', 'Skyline P.G.Telco Colony Hadapsar Pune', 9075390461, 'patilsushant2299@gmail.com', 1, 'MSC', 'Computer Science', 'Shivraj College Gadhinglaj(Shivaji Uniuversity Kolhapur)', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-04-24 12:33:54', '2024-05-04 10:33:43'),
(53, 9, 61, 1887, 'Amar Narayan Gaddam', 'Bhekrai Nagar Hadapsar Pune', 8830846683, 'amargaddam1212@gmail.com', 1, 'BCA', 'Computer', 'S.M.Joshi College Hadapsar pune.', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-04-24 12:56:58', '2024-05-04 10:33:43'),
(54, 9, 60, 1887, 'Pallavi', 'Ganesh Nagar Vadgaonsheri Pune', 9731959116, 'pallavisheelvanth1997@gmail.com', 1, 'B.Tech', 'Electronics & Communication', 'Sharnbasva University kalburgi', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-04-25 08:12:54', '2024-05-04 10:33:43'),
(55, 9, 60, 1887, 'Sarthak Bhau Nimble', 'Manas Valley Society,B-Wing,Bhukum Pune.', 8421851149, 'sarthknimble@gmail.com', 1, 'BSc Pursuing', 'Computer Science', 'Yashwantrao Mohite College Pune.', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-04-25 10:09:55', '2024-05-04 10:33:43'),
(56, 9, 60, 1887, 'Tejas Ajinath Jagdale', 'MIT road Pune', 9881319171, 'tejasjagdale52@gmail.com', 1, 'Graduation Pursuing', 'Computer Science', 'Yashwantrao Mohite College,Pune', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-04-26 10:34:02', '2024-05-04 10:33:43'),
(57, 9, 60, 1887, 'Tejas Sanjay Barguje', 'Kothrud Pune,411038', 7972720204, 'Tejasbarguje7136@gmail.com', 1, 'BSC (C.S) Pursuing', 'Computer Science', 'Yashwantrao Mohite College,Pune', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-04-26 10:48:26', '2024-05-04 10:33:43'),
(58, 9, 60, 1887, 'Kishor Satish Kanse', 'Kothrud Pune', 9623118052, 'kishorkanse11@gmailcom', 1, 'BSC(C.S)', 'Computer Science', 'Yashwantrao Mohite College Pune', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-04-26 10:54:20', '2024-05-04 10:33:43'),
(59, 9, 60, 1887, 'Rahul N Kadam', 'NDA Khadakwasla  Pune', 8610599032, 'rahulkadam8610@gmail.com', 1, 'BCA', 'Computer', 'Karnatak Science College Dharwad', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-04-26 12:15:22', '2024-05-04 10:33:43'),
(60, 9, 60, 1887, 'Rajugoud Mailgond', 'Handewadi road ARV Royle Apartment Pune', 9480920184, 'rajugoudmailgond@gmail.com', 1, 'BCA', 'Computer Application', 'Karnatak Science College Dharwad', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-04-26 12:19:53', '2024-05-04 10:33:43'),
(61, 9, 60, 1887, 'Komal Dhanaji Ghadage', 'Gokhale Nagar Pune', 8421784387, 'komalghadge65@gmail.com', 1, 'BCA', 'Computer Application', 'Modern College Ganeshkhind', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-04-27 10:30:22', '2024-05-04 10:33:43'),
(62, 9, 60, 1887, 'Suyash Ramkrishna Sable', 'Kharadi Pune', 8208176646, 'suyashsable14@gmail.com', 1, 'MCA Pursuing', 'Computer Application', 'Modern College Shivaji Nagar', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-04-29 10:03:22', '2024-05-04 10:33:43'),
(63, 9, 60, 1887, 'Vikrant Dattatray Kadam', 'Ganesh Nagar Bhopkel Pune', 9370687908, 'vikrantkadam3145@gmail.com', 1, 'Bsc (C.S.)', 'Computer Science', 'H.V.Desai Pune', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-04-29 10:10:50', '2024-05-04 10:33:43'),
(64, 9, 60, 1887, 'Sanika Sanjay Kulkarni', 'Yamuna Nagar Nigdi', 8830547399, 'sanikakulkarn0628@gmail.com', 1, 'BCA', 'Computer Application', 'Modern College of Commerce And Computer Studies Pune', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-04-30 06:44:05', '2024-05-04 10:33:43'),
(65, 11, 66, 1885, 'Shubham Dnyaneshwar  Padmane', 'Hinjewadi Pune', 9511998065, 'shubhampadmane4@gmail.com', 1, 'BSC', 'Computer Science', 'SGUBAU', 'Next-date', 'Proceed for test', 1, 1885, NULL, '2024-04-30 09:16:36', '2024-05-04 10:33:43'),
(66, 11, 66, 1885, 'Vivek Balasaheb Bhos', 'Gokhlenagar Pune', 9022738129, 'bhosvivek123@gmail.com', 1, 'BCA', 'Computer Application', 'Modern College', 'Next-date', 'Proceed for test', 1, 1885, NULL, '2024-04-30 09:19:46', '2024-05-04 10:33:43'),
(67, 11, 66, 1885, 'Sharad Appasaheb Gunjal', 'SPPU Ganeshkhind pune', 8975979541, 'sharadgunjal1313@gmail.com', 1, 'BCS', 'Computer Science', 'SPPU', 'Next-date', 'Proceed for test', 1, 1885, NULL, '2024-04-30 09:24:56', '2024-05-04 10:33:43'),
(68, 9, 60, 1887, 'Kalyani Deepak Darekar', 'Kunal Complex J.M. road behind Karve Hospital Shivaji Nagar Pune-411005', 7020922320, 'darekarkalyani2002@gmail.com', 1, 'B.E.', 'Computer Engineer', 'P.D.E.A College of Engineering Manjari Pune', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-04-30 10:20:50', '2024-05-04 10:33:43'),
(69, 9, 60, 1887, 'Pranay Satish Sawant', 'Damodar Vihar Ambegaon Pathar Pune', 7722046322, 'pranaysawant2205@gmail.com', 1, 'BBA(CA)', 'Computer Application', 'Sarhad College of Arts,Commerce & Science Pune', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-05-02 11:40:16', '2024-05-04 10:33:43'),
(70, 9, 60, 1887, 'Pratik Satish Jadhav', 'Ambegaon Pathar Pune', 9767535604, 'jadhavpratik20001@gmail.com', 1, 'BBA(CA)', 'Computer Application', 'Sarhad College of Arts,Commerce & Science Pune', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-05-02 11:44:58', '2024-05-04 10:33:43'),
(88, 9, 61, 1887, 'Akash Fulari', 'balagi Nagar, Pune', 7885465363, 'akashf@gmail.com', 1, 'MCA', 'Computer Application', 'Zeal Institute', 'Confirm', 'Ready for admission.', 1, 1, NULL, '2024-04-04 18:30:00', '2024-05-04 10:52:04'),
(89, 9, 61, 1887, 'Shobha Tukaram Chavan', 'Thergaon Pune', 9604608122, 'shobhachavan865@gmail.com', 1, 'BBA(CA)', 'CA', 'Baburaoji Gholap College', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-06-04 18:30:00', '2024-05-06 07:11:55'),
(90, 9, 61, 1887, 'Abhishek Dnyandev Khedkar ', 'Karvenagar,pune', 9404976535, 'abhishekkhedkar05@gmail.com', 1, 'BTech', 'Computer science and engineering ', 'M.B.E. Society\'s College of engineering ', 'Confirm', 'Confirmed', 1, 1, NULL, '2024-02-29 18:30:00', '2024-05-06 07:11:55'),
(91, 9, 61, 1887, 'Ajay Rajendra Jadhav', 'Survey No 10/3B Surbhi House Sambhaji Nagar Kharadi Pune 14', 9373745116, 'ajay212001jadhav@gmail.com', 1, 'BCS', 'Computers', 'Late Tukaram Dhondiba Pathare College Chandannagar Kharadi', 'Confirm', 'Confirmed', 1, 1, NULL, '2024-02-29 18:30:00', '2024-05-06 07:11:55'),
(92, 9, 61, 1887, 'Anand Rajbanshi Ram ', 'Sr.No 110/111 Tank Road Shantinagar Yerwada Pune 0', 8793779206, 'anand.ram1020@gmail.com', 1, 'BCA', 'BCA(compute application)', 'T.J. college khadki', 'Confirm', 'Confirmed', 1, 1, NULL, '2024-02-29 18:30:00', '2024-05-06 07:11:55'),
(93, 9, 61, 1887, 'Anisha Ashok Takalkar ', 'At post. Kesnand, tal -haveli, 412207\n', 9922865074, 'anishatakalkar@gmail.com', 1, 'BCS', 'Computer science ', 'Vikas pratishthan\'s late T.D.pathare college, Chandan-nagar', 'Confirm', 'Confirmed', 1, 1, NULL, '2024-02-29 18:30:00', '2024-05-06 07:11:55'),
(94, 9, 61, 1887, 'Bhagwat Vishnupant Kokate', 'Flat no.01,Suyog App. Near Jain Boarding,Model Colony, Shivajinage Pune-411005', 9370211305, 'bhagwat.kokate1122@gmail.com', 1, 'BCA', 'BCA', 'Modern College ', 'Confirm', 'Confirmed', 1, 1, NULL, '2024-02-29 18:30:00', '2024-05-06 07:11:55'),
(95, 9, 61, 1887, 'Chandsab Abdulkadar Shaikh', '106, Asharfi Heights, Lane No.3, Ajmera Park Kondhwade', 9049673074, 'mr.chanshaikh9049@gmail.com', 1, 'BCA', 'BCA', 'D.BF.Dayanand College of Arts and Science, Solapur', 'Confirm', 'Confirmed', 1, 1, NULL, '2024-02-29 18:30:00', '2024-05-06 07:11:55'),
(96, 9, 61, 1887, 'Hasan Akabar Tamboli ', 'Gosavi Vasti, Happy Colony,Kothrud,Pune.411038', 8600812919, 'hasantamboli2919@gmail.com', 1, 'BCA', 'Computers', 'Sangola College, Sangola', 'Confirm', 'Confirmed', 1, 1, NULL, '2024-02-29 18:30:00', '2024-05-06 07:11:55'),
(97, 9, 61, 1887, 'Kanchan Shaligram Gaware', 'At post kothali tq motala dist buldhan', 8308662968, 'kanchangaware291@gmail.com', 1, 'BCA', 'IT', 'G S Art\'s commerce and science college of khangaon', 'Confirm', 'Confirmed', 1, 1, NULL, '2024-02-29 18:30:00', '2024-05-06 07:11:55'),
(98, 9, 61, 1887, 'Karan Sudhir Kadam', 'chanai tq,ambajogai,dist beed', 8788212843, 'karankadam3818@gmail.com', 1, 'BTech', 'computer science', 'Mbes ambajogai', 'Confirm', 'Confirmed', 1, 1, NULL, '2024-02-29 18:30:00', '2024-05-06 07:11:55'),
(99, 9, 61, 1887, 'Mayuri Kashinath Gaikwad', ' Sr. no.7/3, Shri Sadguru Krupa, Kharadi Road, Opp Balaji Palace, Rakshaknagar, Kharadi, Pune City, Pune, Maharashtra-411014', 8767276470, 'mayurigaikwad8767@gmail.com', 1, 'BCS', 'Computer Science', 'Late T. D Pathare College Chandannagar Pune-14', 'Confirm', 'Confirmed', 1, 1, NULL, '2024-02-29 18:30:00', '2024-05-06 07:11:55'),
(100, 9, 61, 1887, 'Nisha Ashok Takalkar ', 'At post Kesnand Tal-shirur  ,dist -pune ,pin-412207', 9322075868, 'nishatakalkar03@gmail.com', 1, 'BCS', 'Computer Science ', 'Late T.D pathare Senior College chandannagar Pune-14 ', 'Confirm', 'Confirmed', 1, 1, NULL, '2024-02-29 18:30:00', '2024-05-06 07:11:55'),
(101, 9, 61, 1887, 'Omkar Lahu Gawali ', 'Malli nagar ambajogai ', 9834135158, 'omkargawali0@gmail.com', 1, 'BTech', 'Computer science engineering ', 'M.B.E.S college of engineering ambajogai ', 'Confirm', 'Confirmed', 1, 1, NULL, '2024-02-29 18:30:00', '2024-05-06 07:11:55'),
(102, 9, 61, 1887, 'Pragati Vijay Suwase ', 'K-15, Sankalp Nagari, Parande Nagar, Nr.Dhanori Police chouki, Dhanori Pune - 411015', 9623119962, 'yespragati12@gmail.com', 1, 'BCA', 'Computer Application', 'Modern College ', 'Confirm', 'Confirmed', 1, 1, NULL, '2024-02-29 18:30:00', '2024-05-06 07:11:55'),
(103, 9, 61, 1887, 'Pranav Shankar Patil', 'Balaji nagar ', 9028699017, 'Patilpranav.sp7@gmail.com', 1, 'BTech', 'Computer', 'MBES.college of engineering ambajogai', 'Confirm', 'Confirmed', 1, 1, NULL, '2024-02-29 18:30:00', '2024-05-06 07:11:55'),
(104, 9, 61, 1887, 'Ravindra Babasaheb Nagare', 'Kundan Heights, Tempo Chowk, Wadgaon Sheri, Pune - 411014', 7775083976, 'nagare.rb9@gmail.com', 1, 'BE', 'Computer Engineering', 'Genba Sopanrao Moze College of Engineering, Balewadi - Pune', 'Confirm', 'Confirmed', 1, 1, NULL, '2024-02-29 18:30:00', '2024-05-06 07:11:55'),
(105, 9, 61, 1887, 'Sajid Shahid Maniyar ', 'Mate nager lane no 2 Wadgoan Sheri Pune - 411014', 8999489195, 'sajidmaniyar8@gmail.com', 1, 'B.Voc Software Development ', 'Software Development ', 'Aki\'s poona college of arts science & commerce ', 'Confirm', 'Confirmed', 1, 1, NULL, '2024-02-29 18:30:00', '2024-05-06 07:11:55'),
(106, 9, 61, 1887, 'Sakshi Arjun Dhawale', 'Sr.no 43 Parashar Society Behind Balaji Hospital Pune-411014', 7972339694, 'sakshidhawale2026@gmail.com', 1, 'BCS', 'Computer Science', 'Late Tukaram Dhondiba Pathare College Pune ', 'Confirm', 'Confirmed', 1, 1, NULL, '2024-02-29 18:30:00', '2024-05-06 07:11:55'),
(107, 9, 61, 1887, 'Saloni Hanamant Sabale ', 'Sai satyam park lane number 5 ubalenagar wagholi ', 9356615318, 'salonisabale19@gmail.com', 1, 'BCS', 'Computer Application', 'Late Tukaram Dhondiba Pathare', 'Confirm', 'Confirmed', 1, 1, NULL, '2024-02-29 18:30:00', '2024-05-06 07:11:55'),
(108, 9, 61, 1887, 'Sanket Gajanan kharade ', 'Lane no 14 E dhanori', 8999415723, 'sanketkharade263@gmail.com', 1, 'BE', 'Computer ', 'PGMCOE', 'Confirm', 'Confirmed', 1, 1, NULL, '2024-02-29 18:30:00', '2024-05-06 07:11:55'),
(109, 9, 61, 1887, 'Saware Sneha Sudhir', 'Aadarsh Nagar New Sagvi, Pune ', 9545101406, 'snehasaware01@gmail.com', 1, 'BTech', 'Computer science and engineering ', 'M. B. E. Society\'s college of engineering Ambajogai ', 'Confirm', 'Confirmed', 1, 1, NULL, '2024-02-29 18:30:00', '2024-05-06 07:11:55'),
(110, 9, 61, 1887, 'Shaikh Arshiya Khalil', 'New sangvi', 9421690908, 'arshiyashaikh9975@gmail.com', 1, 'BTech', 'Computer science and engineering ', 'M. B. E. society college of engineering', 'Confirm', 'Confirmed', 1, 1, NULL, '2024-02-29 18:30:00', '2024-05-06 07:11:55'),
(111, 9, 61, 1887, 'Shashikant Dhananjay Karad', 'New sangvi', 9834836118, 'skankt2119@gmail.com', 1, 'B Tech', 'B Tech', 'M. B. E. society college of engineering', 'Confirm', 'Confirmed', 1, 1, NULL, '2024-02-29 18:30:00', '2024-05-06 07:11:55'),
(112, 9, 61, 1887, 'Shrutika Narayan Sarode ', 'Awhalwadi wagholi Pune-412207', 8208867061, 'sarodeshrutika2@gmail.com', 1, 'BCS', 'Computer science ', 'M. B. E. society college of engineering', 'Confirm', 'Confirmed', 1, 1, NULL, '2024-02-29 18:30:00', '2024-05-06 07:11:55'),
(113, 9, 61, 1887, 'Shubhangi Sanjay Dudhalmal ', 'Tuljabhavani Nagar Lane No 4,Near Sunrise Building ,vrundavan building Kharadi -14', 9518935097, 'shubhangidudhalmal@gmail.com', 1, 'BCS', 'Computer science ', 'M. B. E. society college of engineering', 'Confirm', 'Confirmed', 1, 1, NULL, '2024-02-29 18:30:00', '2024-05-06 07:11:55'),
(114, 9, 61, 1887, 'Varsha Vikram Aware', 'Apla Ghar Society E-308, Sanaswadi Tal. Shirur Dist. Pune 4112216', 8378089139, 'varshuaware03@gmail.com', 1, 'BCS', 'BCs', 'M. B. E. society college of engineering', 'Confirm', 'Confirmed', 1, 1, NULL, '2024-02-29 18:30:00', '2024-05-06 07:11:55'),
(115, 9, 61, 1887, 'Rahul Vijay Wadghane', 'Sadashiv Peth Pune', 7385819510, 'wadghanepatil1@gmail.com', 1, 'Graduation Pursuing BBA', 'CA', 'A.G.M.V.P.S\'S New Arts Science & Commerce College Shevgaon Ahmednagar', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-05-05 18:30:00', '2024-05-07 06:27:32'),
(116, 9, 61, 1887, 'Ajinkya Annasaheb Wagh', 'Sadashiv Peth Pune', 9359471202, 'ajinkyaraje2802@gmail.com', 1, 'Graduation Pursunig (BBA)', 'CA', 'A.S.M.V.P.S Ahmednagar', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-05-05 18:30:00', '2024-05-07 06:40:43'),
(117, 9, 61, 1887, 'Saurav Vijay Arsud', 'Shevgaon Dahigaon She Ahmadnagar', 9371512986, 'bcastudent80@gmail.com', 1, 'Graduation Pursuing (BBA)', 'CA', 'A.G.M.V.P.S Ahmadnagar', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-05-05 18:30:00', '2024-05-07 06:58:55'),
(118, 9, 61, 1887, 'Nitish Sunil Kumbhar', 'Satawadi Hadapsar Pune', 7517986769, 'nitishkumbhar@gmail.com', 1, 'BSC', 'CA', 'Annasaheb Magar College Hadapsar', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-05-05 18:30:00', '2024-05-07 07:13:06'),
(119, 9, 61, 1887, 'Fatangade Nageshwar Ashok', 'Madke Shegaon Ahmadnagar', 8010113587, 'nageshwarfatangade86@gmail.com', 1, 'BBA', 'CA', 'A.G.M.V.P.S Ahmadnagar', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-05-05 18:30:00', '2024-05-07 07:20:04'),
(120, 9, 61, 1887, 'Sahil Kalyan Awari', 'Darodi Parner Ahmadnagar', 9545048269, 'awarisahil@gmail.com', 1, 'BSC', 'CA', 'Nowrosjee Wadia College', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-05-05 18:30:00', '2024-05-07 07:24:53'),
(121, 9, 61, 1887, 'Kartik Mahendra Marne', 'Sunita Nagar Wadgaon Sheri Pune', 8999405428, 'kartik1029marne@gmail.com', 1, 'BSC', 'CA', 'Nowrosjee Wadia College Pune', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-05-05 18:30:00', '2024-05-07 07:32:06'),
(122, 9, 61, 1884, 'Kaveri Ganesh Bhoj', 'Jubliant Company Near NIra Pune', 8668977936, 'kaveri1618@gmail.com', 0, 'BSC', 'CA', 'Someshwar Science College Baramati', 'Next-date', 'Confirm', 1, 1, '2024-05-08', '2024-05-05 18:30:00', '2024-05-08 06:24:49'),
(123, 9, 61, 1887, 'Akansha Rajendra Jadhav', 'Bambavade Patan Satara', 8010621390, 'akankshajadhav340@gmail.com', 1, 'Graduation Pursuing (BSC)', 'CA', 'Yashantrao Mohite College Pune', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-05-05 18:30:00', '2024-05-07 07:55:05'),
(124, 9, 61, 1884, 'Siddhesh Manoj Lohar', 'Pimprala Jalogaon', 9325977138, 'loharsid1111@gmail.com', 1, 'Admission Pursuing (CE)', 'CA', 'Khandesh Education Society Engineering College', 'Next-date', 'Confirm', 1, 1887, '2024-05-07', '2024-05-05 18:30:00', '2024-05-07 09:52:56'),
(125, 9, 61, 1887, 'Dipali Sanjay Tayade', 'Jalgaon', 7218679589, 'dipstayade123@gmail.com', 1, 'Admission Pursuing (CE)', 'CA', 'Khandesh Education Society Enggering College', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-05-05 18:30:00', '2024-05-07 09:52:11'),
(126, 9, 61, 1887, 'Vaishnavi Ganesh Amale', 'Satavnagar Hadapsar Pune', 7249884717, 'vaishnaviamale3@gmail.com', 1, 'Admision Pursuing (BSIT)', 'CA', 'Sadabai Raisoni Women\'s College Nagpur', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-05-05 18:30:00', '2024-05-07 09:57:53'),
(127, 9, 61, 1887, 'Shreya Umesh Nagrare', 'Hadapsar Pune', 9130831442, 'sheryanagrare@gmail.com', 1, 'BCA', 'CA', 'Dr. Ambedkar College Dikshadhumi Nagpur', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-05-05 18:30:00', '2024-05-07 10:14:02'),
(128, 9, 61, 1887, 'Prathamesh Sunil Khedkar', 'Satavnagar Hadapsar Pune', 9561439643, 'prathmesh300spk@gmail.com', 1, 'BBA', 'CA', 'College of Commerce, Science & Computer Education Pune', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-05-05 18:30:00', '2024-05-07 10:18:48'),
(129, 9, 61, 1887, 'Sangram Santaji Jadhav', 'Ambegaon Katraj Pune', 9325836665, 'sangramjadhav81@gmail.com', 1, 'BCA', 'CA', 'Adarsh Mahavidyalya.Vita', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-05-05 18:30:00', '2024-05-07 10:31:11'),
(130, 9, 61, 1887, 'Avishkar Baban Ranpise', 'Bhekrainagar Hadapsar Pune', 8379842504, 'avishkar1904@gmail.com', 1, 'BSC', 'CA', 'S.M.Joshi College Hadapsar', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-05-05 18:30:00', '2024-05-07 10:35:42'),
(131, 9, 61, 1887, 'Harshal Vijay Mankar', 'Satavnagar Hadapsar Pune', 9527375867, 'harshalmankar02@gmail.com', 1, 'BSC', 'CA', 'Sant Gadge Baba Amravati University', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-05-05 18:30:00', '2024-05-07 10:44:47'),
(132, 9, 61, 1887, 'Angel Suryakant Bidarkar', 'Old Mundhwa Kharadi Pune', 7218577543, 'angelbidarkar77@gmail.com', 1, 'BE', 'CA', 'College Of Engineering,Ambajogai', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-05-05 18:30:00', '2024-05-07 11:01:35'),
(133, 9, 61, 1887, 'Kalyani Deepak Darekar', 'Kunal Complex J.M.Road Shivajinagar', 7020922320, 'darekarkalyani2002@gmail.com', 1, 'BE', 'CA', 'College Of Engineering Manjari Budruk Pune', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-04-29 18:30:00', '2024-05-07 11:15:29'),
(134, 9, 61, 1887, 'Sanika Sanjay Kulkarni', 'Yamunanagar Nigdi', 8830547399, 'sanikakulkarni0628@gmail.com', 1, 'BBA', 'CA', 'Modern College Pune', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-04-29 18:30:00', '2024-05-07 11:29:47'),
(135, 9, 61, 1887, 'Kunal Sureshchand Rathor', 'Aspriya Appartment Hinjewadi Pune', 9373787528, 'kunalrathor0503@gmail.com', 1, 'BE', 'CA', 'A.I.S.S.M.S. College Of Engineering', 'Confirm', 'Confirm', 1, 1887, NULL, '2024-04-01 18:30:00', '2024-05-07 11:34:53'),
(136, 9, 61, 1884, 'Tejas Nath Mote', 'Gokulnagar Katraj  Kondhwa Pune', 9325103338, 'mc21017@zealeducation.com', 0, 'BBA', 'CA', 'Sarhad College Katraj', 'Next-date', 'Confirm', 0, 1, '2024-05-10', '2024-05-07 18:30:00', '2024-05-10 11:06:49');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `father_name` varchar(255) NOT NULL,
  `mother_name` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL DEFAULT 1 COMMENT '0: Female, 1: Male, 2: Other',
  `contact` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `adhar` varchar(255) NOT NULL,
  `10th` int(255) NOT NULL,
  `12th` int(255) NOT NULL,
  `graduation` int(255) NOT NULL,
  `education` varchar(255) NOT NULL,
  `graduation_passing` varchar(255) NOT NULL,
  `cgpa` varchar(255) NOT NULL,
  `college` varchar(255) NOT NULL,
  `admission` varchar(255) NOT NULL,
  `annual_income` varchar(255) NOT NULL,
  `10th_marksheet` varchar(255) NOT NULL,
  `12th_marksheet` varchar(255) NOT NULL,
  `income_certificate` varchar(255) NOT NULL,
  `graduate_certificate` varchar(255) NOT NULL,
  `photograph` varchar(255) NOT NULL,
  `adhar_card` varchar(255) NOT NULL,
  `isAllocated` int(11) NOT NULL DEFAULT 0 COMMENT '0:not allocated, 1: allocated'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`id`, `project_id`, `course_id`, `name`, `father_name`, `mother_name`, `gender`, `contact`, `email`, `address`, `city`, `state`, `adhar`, `10th`, `12th`, `graduation`, `education`, `graduation_passing`, `cgpa`, `college`, `admission`, `annual_income`, `10th_marksheet`, `12th_marksheet`, `income_certificate`, `graduate_certificate`, `photograph`, `adhar_card`, `isAllocated`) VALUES
(10, 9, 58, 'Abhay Vitthal Sarwade', 'Vitthal Babruwan Sarwade', 'Meera Vitthal Sarwade', 1, 7887535829, 'sarwadea999@gmail.com', 'Prathmesh apartment, Hinjewadi phase 1, Pune 411057', 'Pune', 'Maharashtra', '121213131414', 70, 70, 70, 'BE', '2021-08-01', '', 'JSPM NTC PUNE', '2024-04-02', '600000', '', '', '', '', '', '', 1),
(13, 9, 61, 'Raj Mahadev Kolhe', 'Kallappa', 'Anusaya', 1, 7885465363, 'akashf@gmail.com', 'A/P:-Katraj ,Pune', 'Pune', 'MAHARASHTRA', '124790128988', 68, 87, 89, 'MCA', '2023-04-10', '', 'Zeal Institute', '2024-05-04', '100000', '', '', '', '', '', '', 0),
(14, 9, 61, 'Ajay Rajendra Jadhav', 'Rajendra Jadhav', 'Ranjana Jadhav', 1, 9373745116, 'ajay212001jadhav@gmail.com', 'Survey No 10/3B Surbhi House Sambhaji Nagar Kharadi Pune 14', 'Pune ', 'Maharashtra', '964526704238', 66, 57, 8, 'BCS', '2024-07-10', '', 'Late Tukaram Dhondiba Pathare College Chandannagar Kharadi', '2024-03-02', '70000', '', '', '', '', '', '', 0),
(15, 9, 61, 'Sanket Gajanan kharade', 'Gajanan', 'Asha', 1, 8999415723, 'sanketkharade263@gmail.com', 'B/110 Afra Apartment 90 feet Road Rehamat Nagar Nallasopara East', 'Pune', 'MAHARASHTRA', '459218666386', 81, 61, 75, 'BE', '2023-05-07', '', 'PGMCOE', '2024-03-02', '96000', '', '', '', '', '', '', 0),
(16, 9, 61, 'Saware Sneha Sudhir', 'Sudhir', 'Sawati', 1, 9545101406, 'snehasaware01@gmail.com', 'B/110 Afra Apartment 90 feet Road Rehamat Nagar Nallasopara East', 'Beed', 'MAHARASHTRA', '485632244706', 93, 96, 8, 'BTech', '2024-05-07', '', 'M. B. E. Society\'s college of engineering Ambajogai ', '2024-03-02', '50000', '', '', '', '', '', '', 0),
(17, 9, 61, 'Abhishek Dnyandev Khedkar', 'Dnyandev Khedekar', 'Gayabai Khedekar', 1, 9404976535, 'abhishekkhedkar05@gmail.com', 'Karvenagar,pune', 'Pune', 'Maharashtra', '234415034605', 81, 88, 8, 'BTech', '2024-07-10', '', 'M.B.E. Society\'s College of engineering ', '2024-03-02', '49000', '', '', '', '', '', '', 1),
(18, 9, 61, 'Shaikh Arshiya Khalil', 'Khalil', 'Shahana', 1, 9421690908, 'arshiyashaikh9975@gmail.com', 'Manjara Colony', 'Amaajogai', 'MAHARASHTRA', '900252048982', 89, 66, 8, 'BTech', '2024-07-07', '', 'M. B. E. society college of engineering', '2024-03-02', '50000', '', '', '', '', '', '', 1),
(19, 9, 61, 'Anand Rajbanshi Ram', 'Rajbanshi Ram', 'Sushila Ram', 1, 8793779206, 'anand.ram1020@gmail.com', 'Sr.No 110/111 Tank Road Shantinagar Yerwada Pune 0', 'Pune ', 'Maharashtra', '952030801524', 56, 47, 76, 'BCA', '2021-08-24', '', 'T.J. college khadki', '2024-03-02', '80000', '', '', '', '', '', '', 1),
(20, 9, 61, 'Shashikant Dhananjay Karad', 'Dhananjay', 'Vidhya', 1, 9834836118, 'skankt2119@gmail.com', 'New sangvi', 'Beed', 'Maharashtra', '913736422873', 45, 53, 7, 'B Tech', '2024-07-07', '', 'M. B. E. society college of engineering', '2024-03-02', '70000', '', '', '', '', '', '', 1),
(21, 9, 61, 'Anisha Ashok Takalkar', 'Ashok Takalkar', 'Meera Takalkar', 1, 9922865074, 'anishatakalkar@gmail.com', 'At post. Kesnand, tal -haveli, 412207', 'Pune', 'Maharashtra', '616409245335', 87, 56, 9, 'BCS', '2024-07-10', '', 'Vikas pratishthan\'s late T.D.pathare college, Chandan-nagar', '2024-03-02', '64000', '', '', '', '', '', '', 1),
(22, 9, 61, 'Shrutika Narayan Sarode', 'Narayan', 'Alka', 1, 8208867061, 'sarodeshrutika2@gmail.com', 'Awhalwadi wagholi Pune-412207', 'Pune', 'Maharashtra', '263107088166', 65, 74, 8, 'BCS', '2024-07-07', '', 'M. B. E. society college of engineering', '2024-03-02', '90000', '', '', '', '', '', '', 1),
(23, 9, 61, 'Shubhangi Sanjay Dudhalmal', 'Sanjay', 'Anjali', 1, 9518935097, 'shubhangidudhalmal@gmail.com', 'Tuljabhavani Nagar Lane No 4,Near Sunrise Building ,vrundavan building Kharadi -14', 'Pune', 'Maharashtra', '239211917645', 81, 85, 9, 'BCS', '2024-01-30', '', 'M. B. E. society college of engineering', '2024-03-02', '45000', '', '', '', '', '', '', 1),
(24, 9, 61, 'Pranav Shankar Patil', 'Shankar Patil', 'Yogeshwari Patil', 1, 9028699017, 'Patilpranav.sp7@gmail.com', 'Balaji nagar', 'Pune ', 'Maharashtra', '856640376563', 83, 56, 7, 'BTech', '2024-07-10', '', 'MBES.college of engineering ambajogai', '2024-03-02', '60000', '', '', '', '', '', '', 1),
(25, 9, 61, 'Varsha Vikram Aware', 'Vikram', 'Chhaya', 1, 8378089139, 'varshuaware03@gmail.com', 'Apla Ghar Society E-308, Sanaswadi Tal. Shirur Dist. Pune 4112216', 'Pune', 'Maharashtra', '893108316143', 81, 58, 8, 'BCS', '2024-07-07', '', 'M. B. E. society college of engineering', '2024-03-02', '291690', '', '', '', '', '', '', 1),
(26, 9, 61, 'Sajid Shahid Maniyar', 'Shahid Maniyar', 'Iptaja Maniyar', 1, 8999489195, 'sajidmaniyar8@gmail.com', 'Mate nager lane no 2 Wadgoan Sheri Pune - 411014', 'Pune', 'Maharashtra', '256448979270', 59, 76, 9, 'B.Voc Software Development ', '2024-07-10', '', 'Aki\'s poona college of arts science & commerce ', '2024-03-02', '96000', '', '', '', '', '', '', 1),
(27, 9, 61, 'Omkar Lahu Gawali', 'Lahu', 'Salra', 1, 9834135158, 'omkargawali0@gmail.com', 'Malli nagar ambajogai', 'Ambajogai', 'Maharashtra', '367423491790', 80, 60, 7, 'BTech', '2024-07-07', '', 'M.B.E.S college of engineering ambajogai ', '2024-03-02', '60000', '', '', '', '', '', '', 1),
(28, 9, 61, 'Pragati Vijay Suwase', 'Vijay Suwase', 'Nanda Suwase', 1, 9623119962, 'yespragati12@gmail.com', 'K-15, Sankalp Nagari, Parande Nagar, Nr.Dhanori Police chouki, Dhanori Pune - 411015', 'Pune', 'Maharashtra', '259598047432', 70, 63, 73, 'BCA', '2021-08-24', '', 'Modern College ', '2024-03-02', '457370', '', '', '', '', '', '', 1),
(29, 9, 61, 'Nisha Ashok Takalkar', 'Ashok', 'Mira', 1, 9322075868, 'nishatakalkar03@gmail.com', 'At post Kesnand Tal-shirur  ,dist -pune ,pin-412207', 'Pune', 'Maharashtra', '993519867196', 86, 92, 8, 'BCS', '2024-07-07', '', 'Late T.D pathare Senior College chandannagar Pune-14 ', '2024-03-02', '64000', '', '', '', '', '', '', 1),
(30, 9, 61, 'Mayuri Kashinath Gaikwad', 'Kashinath Gaikwad', 'Satyabhama Gaikwad', 1, 8767276470, 'mayurigaikwad8767@gmail.com', 'Sr. no.7/3, Shri Sadguru Krupa, Kharadi Road, Opp Balaji Palace, Rakshaknagar, Kharadi, Pune City, Pune, Maharashtra-411014', 'Pune', 'Maharashtra', '286251301828', 44, 65, 9, 'BCS', '2024-07-10', '', 'Late T. D Pathare College Chandannagar Pune-14', '2024-03-02', '90000', 'C:/xampp/htdocs/sspl2/assets/uploads/SCCCPL/Tenth/2888087.png', '', '', '', '', '', 1),
(31, 9, 61, 'Karan Sudhir Kadam', 'Sudhir', 'Maya', 1, 8788212843, 'karankadam3818@gmail.com', 'chanai tq,ambajogai,dist beed', 'Beed', 'Maharashtra', '985676649767', 81, 65, 8, 'BTech', '2024-07-07', '', 'Mbes ambajogai', '2024-03-02', '50000', '', '', '', '', '', '', 1),
(32, 9, 61, 'Kanchan Shaligram Gaware', 'Shaligram Gaware', 'Anita Gaware', 1, 8308662968, 'kanchangaware291@gmail.com', 'At post kothali tq motala dist buldhan', 'Pune', 'Maharashtra', '266297982559', 75, 70, 68, 'BCA', '2021-08-24', '', 'G S Art\'s commerce and science college of khangaon', '2024-03-02', '38000', '', '', '', '', '', '', 1),
(33, 9, 61, 'Hasan Akabar Tamboli', 'Akbar Tamboli', 'Nasima Tamboli', 1, 8600812919, 'hasantamboli2919@gmail.com', 'Gosavi Vasti, Happy Colony,Kothrud,Pune.411038', 'Pune', 'Maharashtra', '356891528488', 74, 57, 74, 'BCA', '2023-03-20', '', 'Sangola College, Sangola', '2024-03-02', '60000', '', '', '', '', '', '', 1),
(34, 9, 61, 'Ravindra Babasaheb Nagare', 'Babasaheb', 'Mirabai', 1, 7775083976, 'nagare.rb9@gmail.com', 'Kundan Heights, Tempo Chowk, Wadgaon Sheri, Pune - 411014', 'Pune', 'Maharashtra', '348128531471', 78, 82, 7, 'BE', '2024-07-07', '', 'Genba Sopanrao Moze College of Engineering, Balewadi - Pune', '2024-03-02', '35000', '', '', '', '', '', '', 1),
(35, 9, 61, 'Saloni Hanamant Sabale', 'Hanamant  Sabale', 'Rani Sabale', 1, 9356615318, 'salonisabale19@gmail.com', 'Sai satyam park lane number 5 ubalenagar wagholi', 'Pune', 'Maharashtra', '792007867321', 56, 78, 8, 'BCS', '2024-07-10', '', 'Late Tukaram Dhondiba Pathare', '2024-03-02', '70000', 'C:/xampp/htdocs/sspl2/assets/uploads/SCCCPL/Tenth/2888087_(1).png', '', '', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `enrollment_temp`
--

CREATE TABLE `enrollment_temp` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `screentest_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `gender` int(11) NOT NULL DEFAULT 1 COMMENT '0: Female, 1: Male, 2: Other',
  `contact` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `adhar` varchar(255) DEFAULT NULL,
  `10th` int(255) DEFAULT NULL,
  `12th` int(255) DEFAULT NULL,
  `graduation` int(255) DEFAULT NULL,
  `education` varchar(255) NOT NULL,
  `graduation_passing` varchar(255) DEFAULT NULL,
  `cgpa` varchar(255) DEFAULT NULL,
  `college` varchar(255) NOT NULL,
  `admission` varchar(255) DEFAULT NULL,
  `annual_income` varchar(255) DEFAULT NULL,
  `10th_marksheet` varchar(255) DEFAULT NULL,
  `12th_marksheet` varchar(255) DEFAULT NULL,
  `income_certificate` varchar(255) DEFAULT NULL,
  `graduate_certificate` varchar(255) DEFAULT NULL,
  `photograph` varchar(255) DEFAULT NULL,
  `adhar_card` varchar(255) DEFAULT NULL,
  `isFilledData` int(11) NOT NULL DEFAULT 0 COMMENT '0: not filled data by student\r\n1: filled data by the student'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `permission` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `group_name`, `permission`) VALUES
(1, 'Administrator', 'a:44:{i:0;s:10:\"createUser\";i:1;s:10:\"updateUser\";i:2;s:8:\"viewUser\";i:3;s:10:\"deleteUser\";i:4;s:11:\"createGroup\";i:5;s:11:\"updateGroup\";i:6;s:9:\"viewGroup\";i:7;s:11:\"deleteGroup\";i:8;s:19:\"createScreeningTest\";i:9;s:19:\"updateScreeningTest\";i:10;s:17:\"viewScreeningTest\";i:11;s:19:\"deleteScreeningTest\";i:12;s:15:\"createDocuments\";i:13;s:15:\"updateDocuments\";i:14;s:13:\"viewDocuments\";i:15;s:15:\"deleteDocuments\";i:16;s:11:\"createBrand\";i:17;s:11:\"updateBrand\";i:18;s:9:\"viewBrand\";i:19;s:11:\"deleteBrand\";i:20;s:11:\"createStore\";i:21;s:11:\"updateStore\";i:22;s:9:\"viewStore\";i:23;s:11:\"deleteStore\";i:24;s:13:\"createProduct\";i:25;s:13:\"updateProduct\";i:26;s:11:\"viewProduct\";i:27;s:13:\"deleteProduct\";i:28;s:11:\"createOrder\";i:29;s:11:\"updateOrder\";i:30;s:9:\"viewOrder\";i:31;s:11:\"deleteOrder\";i:32;s:16:\"createAttendance\";i:33;s:16:\"updateAttendance\";i:34;s:14:\"viewAttendance\";i:35;s:16:\"deleteAttendance\";i:36;s:15:\"createPlacement\";i:37;s:15:\"updatePlacement\";i:38;s:13:\"viewPlacement\";i:39;s:15:\"deletePlacement\";i:40;s:11:\"viewReports\";i:41;s:13:\"updateCompany\";i:42;s:11:\"viewProfile\";i:43;s:13:\"updateSetting\";}'),
(4, 'Counseller', 'a:16:{i:0;s:8:\"viewUser\";i:1;s:9:\"viewGroup\";i:2;s:19:\"createScreeningTest\";i:3;s:19:\"updateScreeningTest\";i:4;s:17:\"viewScreeningTest\";i:5;s:9:\"viewBrand\";i:6;s:9:\"viewStore\";i:7;s:13:\"createProduct\";i:8;s:13:\"updateProduct\";i:9;s:11:\"viewProduct\";i:10;s:11:\"createOrder\";i:11;s:11:\"updateOrder\";i:12;s:9:\"viewOrder\";i:13;s:13:\"viewPlacement\";i:14;s:11:\"viewReports\";i:15;s:11:\"viewProfile\";}'),
(15, 'Student', 'a:3:{i:0;s:13:\"viewPlacement\";i:1;s:11:\"viewReports\";i:2;s:11:\"viewProfile\";}'),
(17, 'Project Coordinator', 'a:28:{i:0;s:11:\"createGroup\";i:1;s:11:\"updateGroup\";i:2;s:9:\"viewGroup\";i:3;s:11:\"deleteGroup\";i:4;s:11:\"createBrand\";i:5;s:11:\"updateBrand\";i:6;s:9:\"viewBrand\";i:7;s:11:\"deleteBrand\";i:8;s:14:\"createCategory\";i:9;s:14:\"updateCategory\";i:10;s:12:\"viewCategory\";i:11;s:14:\"deleteCategory\";i:12;s:11:\"createStore\";i:13;s:11:\"updateStore\";i:14;s:9:\"viewStore\";i:15;s:11:\"deleteStore\";i:16;s:15:\"createAttribute\";i:17;s:15:\"updateAttribute\";i:18;s:13:\"viewAttribute\";i:19;s:15:\"deleteAttribute\";i:20;s:13:\"createProduct\";i:21;s:13:\"updateProduct\";i:22;s:11:\"viewProduct\";i:23;s:13:\"deleteProduct\";i:24;s:11:\"createOrder\";i:25;s:11:\"updateOrder\";i:26;s:9:\"viewOrder\";i:27;s:11:\"deleteOrder\";}'),
(18, 'Project Manager', 'a:36:{i:0;s:11:\"createGroup\";i:1;s:11:\"updateGroup\";i:2;s:9:\"viewGroup\";i:3;s:11:\"deleteGroup\";i:4;s:11:\"createBrand\";i:5;s:11:\"updateBrand\";i:6;s:9:\"viewBrand\";i:7;s:11:\"deleteBrand\";i:8;s:14:\"createCategory\";i:9;s:14:\"updateCategory\";i:10;s:12:\"viewCategory\";i:11;s:14:\"deleteCategory\";i:12;s:11:\"createStore\";i:13;s:11:\"updateStore\";i:14;s:9:\"viewStore\";i:15;s:11:\"deleteStore\";i:16;s:15:\"createAttribute\";i:17;s:15:\"updateAttribute\";i:18;s:13:\"viewAttribute\";i:19;s:15:\"deleteAttribute\";i:20;s:13:\"createProduct\";i:21;s:13:\"updateProduct\";i:22;s:11:\"viewProduct\";i:23;s:13:\"deleteProduct\";i:24;s:11:\"createOrder\";i:25;s:11:\"updateOrder\";i:26;s:9:\"viewOrder\";i:27;s:11:\"deleteOrder\";i:28;s:15:\"createPlacement\";i:29;s:15:\"updatePlacement\";i:30;s:13:\"viewPlacement\";i:31;s:15:\"deletePlacement\";i:32;s:11:\"viewReports\";i:33;s:13:\"updateCompany\";i:34;s:11:\"viewProfile\";i:35;s:13:\"updateSetting\";}'),
(19, 'Trainer', 'a:11:{i:0;s:15:\"createDocuments\";i:1;s:15:\"updateDocuments\";i:2;s:13:\"viewDocuments\";i:3;s:15:\"deleteDocuments\";i:4;s:13:\"viewMyBatches\";i:5;s:16:\"createAttendance\";i:6;s:16:\"updateAttendance\";i:7;s:14:\"viewAttendance\";i:8;s:16:\"deleteAttendance\";i:9;s:11:\"viewProfile\";i:10;s:13:\"updateSetting\";}'),
(20, 'Academic Head', 'a:12:{i:0;s:17:\"viewScreeningTest\";i:1;s:13:\"viewDocuments\";i:2;s:13:\"viewMyBatches\";i:3;s:9:\"viewBrand\";i:4;s:9:\"viewStore\";i:5;s:11:\"viewProduct\";i:6;s:9:\"viewOrder\";i:7;s:14:\"viewAttendance\";i:8;s:13:\"viewPlacement\";i:9;s:11:\"viewReports\";i:10;s:11:\"viewProfile\";i:11;s:13:\"updateSetting\";}');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `job_id` varchar(200) NOT NULL,
  `job_title` varchar(200) NOT NULL,
  `job_mail` varchar(200) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `job_possition` varchar(500) NOT NULL,
  `job_description` varchar(1000) NOT NULL,
  `qualification` varchar(200) NOT NULL,
  `submission_date` datetime NOT NULL,
  `no_of_vaccancy` varchar(100) NOT NULL,
  `added_by` int(11) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1 COMMENT '0: inactive\r\n1:active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `branch_id`, `job_id`, `job_title`, `job_mail`, `company_name`, `job_possition`, `job_description`, `qualification`, `submission_date`, `no_of_vaccancy`, `added_by`, `active`, `created_at`, `updated_at`) VALUES
(7, 14, '101', 'Quality analyst', 'mc21017@zealeducation.com', 'infosys', 'to find out bugs in the application', 'to find out bugs in the application familiar with manual and automation testing', 'BE', '2024-04-05 19:00:00', '10', 1, 1, '2024-04-02 12:05:30', '2024-05-10 12:55:35'),
(8, 9, '1237', 'Technical Research Analyst', 'hr@intellipaat.com', 'Intellipaat Software Solutions', 'Technical Research Analyst', '6 month Internship with 220000 fix salary.', 'BE, BTech, MCA', '2024-05-10 19:51:00', '10', 1, 1, '2024-05-07 05:16:34', '2024-05-07 05:16:34');

-- --------------------------------------------------------

--
-- Table structure for table `lead`
--

CREATE TABLE `lead` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `cname` varchar(110) NOT NULL,
  `name` varchar(110) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `address` varchar(300) NOT NULL,
  `college` varchar(100) NOT NULL,
  `follow_date` date DEFAULT NULL,
  `remark` varchar(300) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lead`
--

INSERT INTO `lead` (`id`, `branch_id`, `date`, `cname`, `name`, `email`, `mobile`, `address`, `college`, `follow_date`, `remark`, `status`) VALUES
(177, 9, '2024-04-02', 'Qwerty', 'Suraj', 'suraj@gmail.com', '9898765432', 'Katraj, Pune', 'Symboisis', '2024-04-02', 'Done', 'Next-Date'),
(178, 9, '2024-04-02', 'Qwerty', 'Suraj', 'suraj@gmail.com', '9898765432', 'Katraj, Pune', 'Symboisis', '2024-04-30', 'Done', 'Next-Date');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `branch` varchar(30) NOT NULL,
  `bill_no` varchar(255) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `father_name` varchar(50) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `college` varchar(155) NOT NULL,
  `prof_status` varchar(110) NOT NULL,
  `education` varchar(15) NOT NULL,
  `programe` varchar(50) DEFAULT NULL,
  `organization` varchar(50) NOT NULL,
  `cust_program` varchar(50) DEFAULT NULL,
  `timing` varchar(50) NOT NULL,
  `customer_gst` varchar(150) NOT NULL,
  `caste` varchar(150) NOT NULL DEFAULT 'NULL',
  `password` varchar(20) NOT NULL,
  `date_time` varchar(255) NOT NULL,
  `gross_amount` varchar(255) NOT NULL,
  `service_charge_rate` varchar(255) NOT NULL,
  `service_charge` varchar(255) NOT NULL,
  `vat_charge_rate` varchar(255) NOT NULL,
  `vat_charge` varchar(255) NOT NULL,
  `net_amount` varchar(255) NOT NULL,
  `cheque_number` varchar(25) NOT NULL,
  `pay_mode` varchar(10) NOT NULL,
  `pay` float(15,2) NOT NULL,
  `remain` float(15,2) NOT NULL,
  `discount` varchar(255) NOT NULL,
  `warrenty` varchar(255) NOT NULL,
  `hsn` varchar(255) NOT NULL,
  `paid_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_completed` varchar(100) DEFAULT NULL,
  `fdate` date DEFAULT NULL,
  `remark` varchar(700) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders_item`
--

CREATE TABLE `orders_item` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `imei` varchar(100) NOT NULL,
  `hsn` varchar(150) NOT NULL,
  `color` varchar(50) NOT NULL,
  `s_no` varchar(100) NOT NULL,
  `battery_no` varchar(100) NOT NULL,
  `charger_no` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paid`
--

CREATE TABLE `paid` (
  `id` int(11) NOT NULL,
  `bill_no` varchar(100) NOT NULL,
  `order_id` varchar(10) NOT NULL,
  `pay` float(15,2) NOT NULL,
  `pay_mode` varchar(15) NOT NULL,
  `cheque_number` varchar(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `placement`
--

CREATE TABLE `placement` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `branch` varchar(20) NOT NULL,
  `qualification` varchar(25) NOT NULL,
  `student_name` varchar(125) NOT NULL,
  `address` varchar(255) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(125) NOT NULL,
  `college_name` varchar(255) NOT NULL,
  `10th` float NOT NULL,
  `12th` float NOT NULL,
  `graduate` float NOT NULL,
  `gender` varchar(10) NOT NULL,
  `company_applied` varchar(125) NOT NULL,
  `file` varchar(155) DEFAULT NULL,
  `ssc` varchar(100) DEFAULT NULL,
  `lc` varchar(100) DEFAULT NULL,
  `cast` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `timing` varchar(10) NOT NULL,
  `qty` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `description` text NOT NULL,
  `attribute_value_id` text DEFAULT NULL,
  `brand_id` text NOT NULL,
  `category_id` text NOT NULL,
  `store_id` int(11) NOT NULL,
  `availability` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `screening_test`
--

CREATE TABLE `screening_test` (
  `id` int(11) NOT NULL,
  `enquiry_id` int(11) NOT NULL,
  `apptitude_test_date` date NOT NULL,
  `apptitude_test_marks` int(11) NOT NULL,
  `gd_date` date NOT NULL,
  `gd_marks` int(11) NOT NULL,
  `total_result` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0:fail\r\n1:pass',
  `isEnrolled` int(11) NOT NULL COMMENT '0: Not Enrolled\r\n1: Enrolled',
  `added_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `screening_test`
--

INSERT INTO `screening_test` (`id`, `enquiry_id`, `apptitude_test_date`, `apptitude_test_marks`, `gd_date`, `gd_marks`, `total_result`, `status`, `isEnrolled`, `added_by`, `created_at`, `updated_at`) VALUES
(7, 1, '2024-04-02', 20, '2024-04-02', 20, 40, 1, 1, 1, '2024-04-02 11:37:39', '2024-05-04 10:37:49'),
(8, 2, '2024-04-03', 20, '2024-04-03', 20, 40, 1, 0, 1, '2024-04-03 07:10:51', '2024-05-04 10:37:49'),
(9, 3, '2024-04-10', 25, '2024-04-10', 5, 30, 0, 0, 1, '2024-04-10 06:44:02', '2024-05-04 10:37:49'),
(10, 4, '2024-04-10', 24, '2024-04-10', 20, 44, 1, 1, 1, '2024-04-10 06:46:20', '2024-05-04 10:37:49'),
(11, 5, '2024-04-10', 25, '2024-04-10', 20, 45, 1, 0, 1884, '2024-04-10 07:10:46', '2024-05-04 10:37:49'),
(12, 6, '2024-04-10', 25, '2024-04-10', 5, 30, 0, 0, 1, '2024-04-10 07:41:06', '2024-05-04 10:37:49'),
(13, 7, '2024-04-24', 20, '2024-04-24', 20, 40, 1, 0, 1887, '2024-04-24 11:21:59', '2024-05-04 10:37:49'),
(14, 8, '2024-04-24', 35, '2024-04-24', 15, 50, 1, 0, 1887, '2024-04-24 11:44:51', '2024-05-04 10:37:49'),
(15, 9, '2024-04-24', 41, '2024-04-24', 18, 59, 1, 0, 1887, '2024-04-24 12:10:13', '2024-05-04 10:37:49'),
(16, 10, '2024-04-24', 39, '2024-04-24', 15, 54, 1, 0, 1887, '2024-04-24 12:22:02', '2024-05-04 10:37:49'),
(17, 11, '2024-04-24', 38, '2024-04-24', 16, 44, 1, 0, 1887, '2024-04-24 12:35:44', '2024-05-04 10:37:49'),
(18, 12, '2024-04-24', 26, '2024-04-24', 17, 43, 1, 0, 1887, '2024-04-24 12:57:40', '2024-05-04 10:37:49'),
(19, 13, '2024-04-25', 22, '2024-04-25', 25, 47, 1, 0, 1887, '2024-04-25 08:14:24', '2024-05-04 10:37:49'),
(20, 14, '2024-04-25', 29, '2024-04-25', 16, 45, 1, 0, 1887, '2024-04-25 10:11:09', '2024-05-04 10:37:49'),
(21, 15, '2024-04-26', 27, '2024-04-26', 17, 43, 1, 0, 1887, '2024-04-26 10:40:48', '2024-05-04 10:37:49'),
(22, 16, '2024-04-26', 28, '2024-04-26', 16, 44, 1, 0, 1887, '2024-04-26 10:49:39', '2024-05-04 10:37:49'),
(23, 17, '2024-04-26', 21, '2024-04-26', 15, 36, 1, 0, 1887, '2024-04-26 10:55:38', '2024-05-04 10:37:49'),
(24, 18, '2024-04-26', 22, '2024-05-12', 15, 37, 1, 0, 1887, '2024-04-26 12:16:19', '2024-05-04 10:37:49'),
(25, 19, '2024-04-26', 31, '2024-04-26', 18, 49, 1, 0, 1887, '2024-04-26 12:20:45', '2024-05-04 10:37:49'),
(26, 20, '2024-04-27', 30, '2024-04-27', 20, 50, 1, 0, 1887, '2024-04-27 10:31:28', '2024-05-04 10:37:49'),
(27, 21, '2024-04-29', 22, '2024-04-29', 17, 39, 1, 0, 1887, '2024-04-29 10:08:18', '2024-05-04 10:37:49'),
(28, 22, '2024-04-29', 21, '2024-04-29', 17, 38, 1, 0, 1887, '2024-04-29 10:11:57', '2024-05-04 10:37:49'),
(29, 23, '2024-04-30', 20, '2024-04-30', 15, 35, 1, 0, 1887, '2024-04-30 06:44:49', '2024-05-04 10:37:49'),
(30, 24, '2024-04-30', 15, '2024-04-30', 15, 30, 1, 0, 1885, '2024-04-30 09:34:17', '2024-05-04 10:37:49'),
(31, 25, '2024-04-30', 22, '2024-04-30', 16, 38, 1, 0, 1885, '2024-04-30 09:37:28', '2024-05-04 10:37:49'),
(32, 26, '2024-04-30', 15, '2024-04-30', 15, 30, 1, 0, 1885, '2024-04-30 09:39:03', '2024-05-04 10:37:49'),
(33, 27, '2024-04-30', 24, '2024-04-30', 16, 40, 1, 0, 1887, '2024-04-30 10:21:34', '2024-05-04 10:37:49'),
(34, 28, '2024-04-01', 31, '2024-04-01', 15, 46, 1, 0, 1887, '2024-04-30 11:21:00', '2024-05-04 10:37:49'),
(35, 29, '2024-04-10', 33, '2024-04-10', 18, 51, 1, 0, 1887, '2024-04-30 11:24:40', '2024-05-04 10:37:49'),
(36, 30, '2024-04-12', 22, '2024-04-12', 15, 37, 1, 0, 1887, '2024-04-30 11:48:14', '2024-05-04 10:37:49'),
(37, 31, '2024-04-10', 31, '2024-04-10', 17, 48, 1, 0, 1887, '2024-04-30 12:18:50', '2024-05-04 10:37:49'),
(38, 32, '2024-04-15', 34, '2024-04-15', 17, 51, 1, 0, 1887, '2024-04-30 12:25:20', '2024-05-04 10:37:49'),
(39, 33, '2024-04-01', 28, '2024-04-01', 16, 44, 1, 0, 1887, '2024-04-30 12:29:59', '2024-05-04 10:37:49'),
(40, 34, '2024-04-12', 26, '2024-04-12', 18, 44, 1, 0, 1887, '2024-04-30 12:33:08', '2024-05-04 10:37:49'),
(41, 35, '2024-04-01', 26, '2024-04-01', 15, 41, 1, 0, 1887, '2024-04-30 13:14:27', '2024-05-04 10:37:49'),
(42, 36, '2024-05-02', 24, '2024-05-02', 19, 43, 1, 0, 1887, '2024-05-02 11:42:04', '2024-05-04 10:37:49'),
(43, 37, '2024-05-02', 35, '2024-05-02', 17, 52, 1, 0, 1887, '2024-05-02 11:45:39', '2024-05-04 10:37:49'),
(44, 88, '2024-05-04', 34, '2024-05-15', 22, 55, 1, 1, 1, '2024-05-04 10:52:04', '2024-05-04 10:58:56'),
(45, 90, '2024-03-02', 30, '2024-03-02', 16, 46, 1, 1, 1, '2024-05-06 07:11:55', '2024-05-07 04:58:12'),
(46, 91, '2024-03-02', 23, '2024-03-02', 8, 31, 1, 1, 1, '2024-05-06 07:11:55', '2024-05-07 04:52:16'),
(47, 92, '2024-03-02', 27, '2024-03-02', 15, 42, 1, 1, 1, '2024-05-06 07:11:55', '2024-05-07 05:02:16'),
(48, 93, '2024-03-02', 30, '2024-03-02', 17, 47, 1, 1, 1, '2024-05-06 07:11:55', '2024-05-07 05:07:26'),
(49, 94, '2024-03-02', 34, '2024-03-02', 17, 51, 1, 0, 1, '2024-05-06 07:11:55', '2024-05-06 07:24:58'),
(50, 95, '2024-03-02', 20, '2024-03-02', 18, 38, 1, 0, 1, '2024-05-06 07:11:55', '2024-05-06 07:24:58'),
(51, 96, '2024-03-02', 28, '2024-03-02', 15, 43, 1, 1, 1, '2024-05-06 07:11:55', '2024-05-07 05:27:44'),
(52, 97, '2024-03-02', 20, '2024-03-02', 15, 35, 1, 1, 1, '2024-05-06 07:11:55', '2024-05-07 05:24:25'),
(53, 98, '2024-03-02', 28, '2024-03-02', 16, 44, 1, 1, 1, '2024-05-06 07:11:55', '2024-05-07 05:23:11'),
(54, 99, '2024-03-02', 27, '2024-03-02', 21, 48, 1, 1, 1, '2024-05-06 07:11:55', '2024-05-07 05:21:11'),
(55, 100, '2024-03-02', 27, '2024-03-02', 18, 45, 1, 1, 1, '2024-05-06 07:11:55', '2024-05-07 05:20:33'),
(56, 101, '2024-03-02', 20, '2024-03-02', 15, 35, 1, 1, 1, '2024-05-06 07:11:55', '2024-05-07 05:17:30'),
(57, 102, '2024-03-02', 25, '2024-03-02', 18, 43, 1, 1, 1, '2024-05-06 07:11:55', '2024-05-07 05:18:51'),
(58, 103, '2024-03-02', 26, '2024-03-02', 18, 41, 1, 1, 1, '2024-05-06 07:11:55', '2024-05-07 05:11:01'),
(59, 104, '2024-03-02', 23, '2024-03-02', 19, 42, 1, 1, 1, '2024-05-06 07:11:55', '2024-05-07 05:29:34'),
(60, 105, '2024-03-02', 30, '2024-03-02', 21, 51, 1, 1, 1, '2024-05-06 07:11:55', '2024-05-07 05:14:26'),
(61, 106, '2024-03-02', 27, '2024-03-02', 21, 48, 1, 0, 1, '2024-05-06 07:11:55', '2024-05-06 07:24:58'),
(62, 107, '2024-03-02', 25, '2024-03-02', 24, 49, 1, 1, 1, '2024-05-06 07:11:55', '2024-05-07 05:30:40'),
(63, 108, '2024-03-02', 28, '2024-03-02', 24, 52, 1, 1, 1, '2024-05-06 07:11:55', '2024-05-07 04:53:38'),
(64, 109, '2024-03-02', 27, '2024-03-02', 16, 43, 1, 1, 1, '2024-05-06 07:11:55', '2024-05-07 04:57:52'),
(65, 110, '2024-03-02', 33, '2024-03-02', 16, 49, 1, 1, 1, '2024-05-06 07:11:55', '2024-05-07 05:01:38'),
(66, 111, '2024-03-02', 26, '2024-03-02', 19, 45, 1, 1, 1, '2024-05-06 07:11:55', '2024-05-07 05:04:49'),
(67, 89, '2024-03-02', 25, '2024-03-02', 15, 40, 1, 0, 1, '2024-05-06 07:11:55', '2024-05-06 07:24:58'),
(68, 112, '2024-03-02', 25, '2024-03-02', 17, 42, 1, 1, 1, '2024-05-06 07:11:55', '2024-05-07 05:08:00'),
(69, 113, '2024-03-02', 29, '2024-03-02', 21, 50, 1, 1, 1, '2024-05-06 07:11:55', '2024-05-07 05:10:31'),
(70, 114, '2024-03-02', 29, '2024-03-02', 18, 47, 1, 1, 1, '2024-05-06 07:11:55', '2024-05-07 05:14:20'),
(71, 115, '2024-05-06', 37, '2024-05-06', 15, 52, 1, 0, 1887, '2024-05-07 06:27:32', '2024-05-07 06:27:32'),
(72, 116, '2024-05-06', 35, '2024-05-06', 15, 50, 1, 0, 1887, '2024-05-07 06:40:43', '2024-05-07 06:40:43'),
(73, 117, '2024-05-06', 28, '2024-05-06', 15, 43, 1, 0, 1887, '2024-05-07 06:58:55', '2024-05-07 06:58:55'),
(74, 118, '2024-05-06', 38, '2024-05-06', 18, 56, 1, 0, 1887, '2024-05-07 07:13:06', '2024-05-07 07:13:06'),
(75, 119, '2024-05-06', 21, '2024-05-06', 15, 36, 1, 0, 1887, '2024-05-07 07:20:04', '2024-05-07 07:20:04'),
(76, 120, '2024-05-06', 32, '2024-05-06', 17, 49, 1, 0, 1887, '2024-05-07 07:24:53', '2024-05-07 07:24:53'),
(77, 121, '2024-05-06', 36, '2024-05-06', 18, 54, 1, 0, 1887, '2024-05-07 07:32:06', '2024-05-07 07:32:06'),
(78, 122, '2024-05-06', 25, '2024-05-06', 16, 41, 1, 0, 1887, '2024-05-07 07:46:07', '2024-05-07 07:46:07'),
(79, 41, '2024-05-07', 25, '2024-05-07', 21, 46, 1, 0, 1, '2024-05-07 07:49:02', '2024-05-07 07:49:02'),
(80, 123, '2024-05-06', 27, '2024-05-06', 22, 49, 1, 0, 1887, '2024-05-07 07:55:05', '2024-05-07 07:55:05'),
(81, 124, '2024-05-06', 39, '2024-05-06', 15, 44, 1, 0, 1887, '2024-05-07 09:45:40', '2024-05-07 09:45:40'),
(82, 125, '2024-05-06', 33, '2024-05-06', 19, 52, 1, 0, 1887, '2024-05-07 09:52:11', '2024-05-07 09:52:11'),
(83, 126, '2024-05-06', 37, '2024-05-06', 21, 58, 1, 0, 1887, '2024-05-07 09:57:53', '2024-05-07 09:57:53'),
(84, 127, '2024-05-06', 38, '2024-05-06', 16, 54, 1, 0, 1887, '2024-05-07 10:14:02', '2024-05-07 10:14:02'),
(85, 128, '2024-05-06', 43, '2024-05-06', 16, 59, 1, 0, 1887, '2024-05-07 10:18:48', '2024-05-07 10:18:48'),
(86, 129, '2024-05-06', 40, '2024-05-06', 18, 58, 1, 0, 1887, '2024-05-07 10:31:11', '2024-05-07 10:31:11'),
(87, 130, '2024-05-06', 38, '2024-05-06', 19, 57, 1, 0, 1887, '2024-05-07 10:35:42', '2024-05-07 10:35:42'),
(88, 131, '2024-05-06', 37, '2024-05-06', 22, 59, 1, 0, 1887, '2024-05-07 10:44:47', '2024-05-07 10:44:47'),
(89, 132, '2024-05-06', 26, '2024-05-06', 22, 48, 1, 0, 1887, '2024-05-07 11:01:35', '2024-05-07 11:01:35'),
(90, 133, '2024-04-30', 24, '2024-04-30', 16, 40, 1, 0, 1887, '2024-05-07 11:15:29', '2024-05-07 11:15:29'),
(91, 134, '2024-04-30', 20, '2024-04-30', 15, 35, 1, 0, 1887, '2024-05-07 11:29:47', '2024-05-07 11:29:47'),
(92, 135, '2024-04-02', 22, '2024-04-02', 16, 38, 1, 0, 1887, '2024-05-07 11:34:53', '2024-05-07 11:34:53');

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `added_by` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `name`, `added_by`, `active`, `created_at`, `updated_at`) VALUES
(9, 'Capgemini- SDA', 1, 1, '2024-04-02 11:22:51', '2024-04-04 09:27:04'),
(10, 'WINGYAAN (FIAT)', 1, 1, '2024-04-02 13:57:54', '2024-04-04 07:59:38'),
(11, 'Future Ready Skills Training', 1, 1, '2024-04-03 11:44:43', '2024-04-03 11:44:43'),
(12, 'Capgemini- SDA XT', 1, 1, '2024-04-03 11:45:20', '2024-04-03 11:45:20'),
(13, 'SWATI (PTPL)', 1, 1, '2024-04-03 11:45:44', '2024-04-03 11:45:44'),
(14, 'PCMC', 1, 1, '2024-04-03 11:45:52', '2024-04-04 09:27:09');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `subject_title` text NOT NULL,
  `duration_in_hour` text NOT NULL,
  `duration_in_months` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `project_id`, `course_id`, `subject_title`, `duration_in_hour`, `duration_in_months`, `created_at`) VALUES
(6, 2, 1, 'java', '3 hour', '3 months', '2024-03-31 06:46:03'),
(8, 2, 2, 'java', '3 hour', '3 month', '2024-03-31 09:01:46'),
(9, 1, 1, 'Test', '5 hour', '5 month', '2024-03-31 09:05:27'),
(10, 2, 1, 'java', '3 hour', '3 month', '2024-03-31 11:32:32'),
(11, 1, 19, 'java', '4', '3', '2024-03-31 11:34:35');

-- --------------------------------------------------------

--
-- Table structure for table `subjectnew`
--

CREATE TABLE `subjectnew` (
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `bid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjectnew`
--

INSERT INTO `subjectnew` (`id`, `subject`, `faculty_id`, `bid`) VALUES
(44, 'Soft skill', 1884, 13),
(48, 'Express.js', 1887, 15),
(49, 'Express.js', 1884, 14),
(50, 'Softskill', 1, 16),
(51, 'Soft skill', 1885, 14),
(52, 'Soft skill', 1887, 15),
(55, 'Java Full Stack', 1889, 17),
(56, 'Full Stack Java', 1890, 18),
(57, 'Full Stack Java', 1890, 0),
(58, 'Full Stack Java', 1889, 19),
(59, 'Full Stack Java', 1889, 20),
(60, 'Full Stack Java', 1889, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 1 COMMENT '0: inactive, 1: active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `firstname`, `lastname`, `phone`, `gender`, `branch_id`, `active`) VALUES
(1, 'Admin', '$2y$10$GmdTpeIw3E51m7gMgRP0bOqL61CrjScZLYIIvniYuKVfMA40Csh1S', 'admin@sccpl.com', 'SCCCPL', '', '7796638372', 1, 0, 1),
(1884, 'Rupampaul', '$2y$10$QrVsm9qYdp7itpqOvrDYvOIefavEJGFuHlj8TesLF7bcAmA8kEMuG', 'rupam.paul@soes.ac.in', 'Rupam', 'Paul', '9022565767', 1, 9, 1),
(1885, 'anjali', '$2y$10$i1cTzZ9q3sScQ8MT6DBOZuDHBf6FmEqx35IV304PnLEDPujAj66Ua', 'anjali.chandale@soes.ac.in', 'Anjali', 'Chandale', '9028492779', 2, 11, 1),
(1886, 'Munazir', '$2y$10$OdBeFPNPCp.OcVYfHY10PuZx0QsF6opYs7x9m6dfoTaynjzOBNMHe', 'munazir.husain@soes.ac.in', 'Munazir', 'Hussain', '7823834200', 1, 9, 1),
(1887, 'Munazir H', '$2y$10$mgrO34k/Pt7ySrArTQN2n.8JHfNFPIrlzT608qB3RYsuU30PsbMP6', 'munazir.hussain@soes.ac.in', 'Munazir', 'Hussain C', '7823734200', 1, 9, 1),
(1888, 'Kalyani', '$2y$10$z1yGnW9oLEFg6tNAYYbgXuyXWo0AlIvyNG2pVbEL/DfcKbXupye06', 'kalyani.choudhari@soes.ac.in', 'Kalyani', 'Choudhari', '9579461918', 2, 10, 1),
(1889, 'raj.kolhe', '$2y$10$Cv9jsLTwViLX/./fWf4MOe0j2hk7CP95lfcw/0EMvmRN09YiDwEt.', 'kolhe.raj@gmail.com', 'Raj', 'Kolhe', '7262028776', 1, 9, 1),
(1890, 'Kiran Tiwari', '$2y$10$Gx3asc0y2AzUA7EAKCbZ1.BgRMfQit2YFBenovsmVWYgSwNGwHCcG', 'kiran.lkw7@gmail.com', 'Kiran', 'Tiwari', '8378081221', 2, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(1918, 1880, 4),
(1919, 1883, 15),
(1920, 1884, 4),
(1921, 1885, 4),
(1922, 1886, 17),
(1923, 1887, 4),
(1924, 1888, 4),
(1925, 1889, 19),
(1926, 1890, 19);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allocated_batch`
--
ALTER TABLE `allocated_batch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applied_jobs`
--
ALTER TABLE `applied_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_value`
--
ALTER TABLE `attribute_value`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry`
--
ALTER TABLE `enquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrollment_temp`
--
ALTER TABLE `enrollment_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lead`
--
ALTER TABLE `lead`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_item`
--
ALTER TABLE `orders_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paid`
--
ALTER TABLE `paid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `placement`
--
ALTER TABLE `placement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `screening_test`
--
ALTER TABLE `screening_test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjectnew`
--
ALTER TABLE `subjectnew`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allocated_batch`
--
ALTER TABLE `allocated_batch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `applied_jobs`
--
ALTER TABLE `applied_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `attribute_value`
--
ALTER TABLE `attribute_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `batch`
--
ALTER TABLE `batch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `enquiry`
--
ALTER TABLE `enquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `enrollment`
--
ALTER TABLE `enrollment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `enrollment_temp`
--
ALTER TABLE `enrollment_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `lead`
--
ALTER TABLE `lead`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1899;

--
-- AUTO_INCREMENT for table `orders_item`
--
ALTER TABLE `orders_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4289;

--
-- AUTO_INCREMENT for table `paid`
--
ALTER TABLE `paid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `placement`
--
ALTER TABLE `placement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `screening_test`
--
ALTER TABLE `screening_test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `subjectnew`
--
ALTER TABLE `subjectnew`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1891;

--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1927;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
