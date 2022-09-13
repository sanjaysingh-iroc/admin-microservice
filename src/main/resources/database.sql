
DROP TABLE IF EXISTS acedemy_details;
DROP TABLE IF EXISTS class_details;
DROP TABLE IF EXISTS class_section_details;
DROP TABLE IF EXISTS class_subject_details;
DROP TABLE IF EXISTS exams_details;
DROP TABLE IF EXISTS exams_schedule_details;
DROP TABLE IF EXISTS fees_details;
DROP TABLE IF EXISTS fees_type_details;
DROP TABLE IF EXISTS gender_details;
DROP TABLE IF EXISTS holiday_details;
DROP TABLE IF EXISTS login_details;
DROP TABLE IF EXISTS marks_grades_details;
DROP TABLE IF EXISTS payment_type_details;
DROP TABLE IF EXISTS session_details;
DROP TABLE IF EXISTS setting_details;
DROP TABLE IF EXISTS student_activity_details;
DROP TABLE IF EXISTS student_attendance_details;
DROP TABLE IF EXISTS student_details;
DROP TABLE IF EXISTS student_document_details;
DROP TABLE IF EXISTS student_exams_marks_details;
DROP TABLE IF EXISTS subject_details;
DROP TABLE IF EXISTS token_details;
DROP TABLE IF EXISTS user_details;
DROP TABLE IF EXISTS user_type;
DROP TABLE IF EXISTS weekly_details;


CREATE TABLE acedemy_details (
  `acedemy_details_id` bigint(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `acedemy_name` varchar(50) NOT NULL,
  `establishment_date` date NOT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `logo_img` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `class_details` (
  `class_id` bigint(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `class_name` varchar(50) NOT NULL,
  `session_year` integer,
  `is_active` boolean DEFAULT 1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `class_section_details` (
  `class_section_id` bigint(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `class_id` bigint(10) NOT NULL,
  `section_name` varchar(50) NOT NULL,
  `is_active` boolean DEFAULT 1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `class_subject_details` (
  `class_subject_details_id` bigint(1) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `class_id` int(3) NOT NULL,
  `subject_id` int(3) NOT NULL,
  `is_practical` boolean DEFAULT 0 NOT NULL,
  `is_active` boolean DEFAULT 1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `exams_details` (
  `exams_details_id` bigint(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `exams_name` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_payable` tinyint(1) NOT NULL DEFAULT '0',
  `session_year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `exams_schedule_details` (
  `exams_schedule_details_id` bigint(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `exams_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `theory_schedule_date` varchar(255),
  `theory_start_time` varchar(255),
  `theory_end_time` varchar(255),
  `theory_maximum_marks` float,
  `practical_end_time` varchar(255),
  `practical_schedule_date` varchar(255),
  `practical_start_time` varchar(255),
  `practical_maximum_marks` float,
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `fees_details` (
  `fees_id` bigint(20) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `amount` float NOT NULL,
  `late_fee_amount` float,
  `other_details` varchar(255) DEFAULT NULL,
  `fee_type` int(11) NOT NULL,
  `months_details` varchar(255) DEFAULT NULL,
  `exam_id` int(5) DEFAULT NULL,
  `session_year` int(2) NOT NULL,
  `payment_mode` int(11) NOT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `cheque_no` varchar(255) DEFAULT NULL,
  `student_id` int(11) NOT NULL,
  `date_of_submission` date NOT NULL,
  `is_active` boolean DEFAULT 1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `fees_type_details` (
  `fees_type_id` bigint(2) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `fee_type` varchar(50) NOT NULL,
  `is_monthly` boolean DEFAULT 0 NOT NULL,
  `is_exam` boolean DEFAULT 0 NOT NULL,
  `is_active` boolean DEFAULT 1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `gender_details` (
  `gender_id` bigint(2) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `gender_detail` varchar(50) NOT NULL,
  `is_active` boolean DEFAULT 1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `holiday_details` (
  `holiday_id` int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `holiday_date` date DEFAULT NULL,
  `holiday_name` varchar(255) DEFAULT NULL,
  `session_year` int(2) DEFAULT NULL,
  `is_active` boolean DEFAULT 1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `login_details` (
  `login_details_id` bigint(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `user_id` bigint(10) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `password_details` varchar(20) NOT NULL,
  `user_type` bigint(2) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `marks_grades_details` (
  `id` bigint(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `min_percentage` float DEFAULT NULL,
  `max_percentage` float DEFAULT NULL,
  `grade_name` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `payment_type_details` (
  `payment_type_id` bigint(2) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `payment_type` varchar(50) NOT NULL,
  `is_cheque` boolean DEFAULT 0 NOT NULL,
  `is_active` boolean DEFAULT 1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `session_details` (
  `session_details_id` bigint(2) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `session_year` varchar(50) NOT NULL,
  `sequence_order` int(11) DEFAULT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `is_active` boolean DEFAULT 1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `setting_details` (
  `setting_details_id` bigint(3) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `setting_key` varchar(255) NOT NULL,
  `setting_value` varchar(255) NOT NULL,
  `is_active` boolean DEFAULT 1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `student_activity_details` (
  `id` bigint(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `session_year` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `roll_no` varchar(255) DEFAULT NULL,
  `is_promote` boolean DEFAULT 0 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `student_attendance_details` (
  `attendance_id` bigint(20) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `class_section_id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `is_active` boolean DEFAULT 1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `student_details` (
  `id` bigint(20) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `emergency_mobile` varchar(255) DEFAULT NULL,
  `enroll` varchar(255) DEFAULT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `gender` int(11) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  `student_img` varchar(255) DEFAULT NULL,
  `sr_no` bigint(20) DEFAULT NULL,
  `joining_session` int(11) DEFAULT NULL,
  `exit_session` int(11) DEFAULT NULL,
  `exit_date` date DEFAULT NULL,
  `is_active` boolean DEFAULT 1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `student_document_details` (
  `document_id` bigint(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `student_id` int(11) NOT NULL,
  `document_name` varchar(250) NOT NULL,
  `upload_document` varchar(250) NOT NULL,
  `is_active` boolean DEFAULT 1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `student_exams_marks_details` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `exams_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `class_id` int,
  `class_section_id` int(11) DEFAULT NULL,
  `theory_marks_obtained` varchar(255),
  `theory_maximum_marks` float,
  `practical_marks_obtained` varchar(255),
  `practical_maximum_marks` float
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `subject_details` (
  `subject_id` int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `subject_name` varchar(255) DEFAULT NULL,
  `is_active` boolean DEFAULT 1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `token_details` (
  `token_details_id` bigint(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `user_id` bigint(10) NOT NULL,
  `token` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `expired_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `user_details` (
  `user_details_id` bigint(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` int(11) NOT NULL,
  `dob` date DEFAULT NULL,
  `emergency_mobile` varchar(15) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `education` varchar(100) DEFAULT NULL,
  `user_img` varchar(200) DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `is_active` boolean DEFAULT 1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `user_type` (
  `user_type_id` bigint(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `user_type_value` varchar(50) NOT NULL,
  `is_active` boolean DEFAULT 1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `weekly_details` (
  `weekly_details_id` bigint(1) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `week_days` varchar(50) NOT NULL,
  `week_day_number` int(1) NOT NULL,
  `is_off` boolean DEFAULT 1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `acedemy_details` (`acedemy_details_id`, `acedemy_name`, `address`, `email`, `establishment_date`, `logo_img`, `mobile`, `phone_no`) VALUES
(3, 'Simpkins public school', 'Gwalior', 'sa@gmail.com', '2020-09-02', NULL, '8527627675', '08527627675');


INSERT INTO `fees_type_details` (`fees_type_id`, `fee_type`,`is_monthly`, `is_exam`, `is_active`) VALUES
(1, 'Annual',0,0, 1),
(2, 'Monthly',1,0, 1),
(3, 'Tution',0,0, 1),
(4, 'Exam',0,1, 1),
(5, 'Library',0,0, 1),
(6, 'Other',0,0, 1);

INSERT INTO `gender_details` (`gender_id`, `gender_detail`, `is_active`) VALUES
(1, 'Male', 1),
(2, 'Female', 1),
(3, 'Other', 1);

INSERT INTO `login_details` (`login_details_id`, `user_id`, `email_id`, `mobile_no`, `password_details`, `user_type`, `is_active`) VALUES
(1, 1, 'email@email.com', 'mobile', 'password123', 2, 1);

INSERT INTO `marks_grades_details` (`id`, `min_percentage`, `max_percentage`, `grade_name`) VALUES
(1, 0, 20, 'E2'),
(2, 21, 32, 'E'),
(3, 33, 40, 'D'),
(4, 41, 50, 'C2'),
(5, 51, 60, 'C1'),
(6, 61, 70, 'B2'),
(7, 71, 80, 'B1'),
(8, 81, 90, 'A2'),
(9, 91, 100, 'A1');

INSERT INTO `payment_type_details` (`payment_type_id`, `payment_type`,`is_cheque`, `is_active`) VALUES
(1, 'Cash',0, 1),
(2, 'Cheque',1, 1),
(3, 'Online Transfer',0, 1),
(4, 'Draft', 1,1),
(5, 'Other', 0,1);

INSERT INTO `session_details` (`session_details_id`, `session_year`, `is_active`, `sequence_order`, `from_date`, `to_date`) VALUES
(1, '2015-2016', 0, 1, '2015-04-01', '2016-03-31'),
(2, '2016-2017', 0, 2, '2016-04-01', '2017-03-31'),
(3, '2017-2018', 0, 3, '2017-04-01', '2018-03-31'),
(4, '2018-2019', 0, 4, '2018-04-01', '2019-03-31'),
(5, '2019-2020', 0, 5, '2019-04-01', '2020-03-31'),
(6, '2020-2021', 1, 6, '2020-04-01', '2021-03-31'),
(7, '2021-2022', 2, 7, '2021-04-01', '2022-03-31');

INSERT INTO `setting_details` (`setting_details_id`, `setting_key`, `setting_value`, `is_active`) VALUES
(1, 'DATE_FORMAT', 'dd/MM/YYYY', 1);

INSERT INTO `user_details` (`user_details_id`, `name`, `gender`, `dob`, `emergency_mobile`, `address`, `education`, `user_img`, `is_active`, `date_of_joining`) VALUES
(1, 'Sanjay', 2, '1986-07-01', '', '', '', NULL, 1, NULL);

INSERT INTO `user_type` (`user_type_id`, `user_type_value`, `is_active`) VALUES
(1, 'Super Admin', 1),
(2, 'Librarian', 1),
(3, 'Laboratory', 1),
(4, 'Teacher', 1);

INSERT INTO `weekly_details` (`weekly_details_id`, `week_days`, `week_day_number`, `is_off`) VALUES
(1, 'Sunday', 0, 1),
(2, 'Saturday', 6, 0);
