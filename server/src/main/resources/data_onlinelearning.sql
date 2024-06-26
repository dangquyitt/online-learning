-- Host: localhost
-- Generation Time: Apr 23, 2023 at 08:47 AM
-- Server version: 8.0.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `OnlineLearning`
--

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `author`, `category`, `price`, `rating`, `subtitle`, `thumb_url`, `title`, `is_featured`)
VALUES (10010, 'Corey Schafer', 'Development', '17.99', '4.50',
        'Learn Python like a Professional. Start from the basics and go all the way to creating your own applications and games.',
        'https://i3.ytimg.com/vi/XKHEtdqhLK8/maxresdefault.jpg', 'Complete Python Bootcamp', b'1'),
       (10011, 'Dani Krossing', 'Development', '18.99', '4.50',
        'Master fundamentals with JavaScript exercises, projects, live examples & more',
        'https://i3.ytimg.com/vi/jS4aFq5-91M/maxresdefault.jpg', 'Learn JavaScript Programming', b'1'),
       (10012, 'Caleb Curry', 'Development', '19.99', '3.50', 'Obtain valuable Core Java Skills And Java Certification',
        'https://i3.ytimg.com/vi/GoXwIVyNvX0/maxresdefault.jpg', 'Java Programming Essentials', b'0'),
       (10013, 'Gareth David Studio', 'PhotoVideo', '21.99', '4.00',
        'Learn graphic design, logo design, and more with this in-depth, practical, easy-to-follow course!',
        'https://i3.ytimg.com/vi/9EGI-FSr0Ig/maxresdefault.jpg', 'Beginners Guide To Adobe Illustrator', b'1'),
       (10014, 'chinfat', 'PhotoVideo', '22.50', '3.50',
        'Learn Beginner-Advanced Video Editing, Audio Editing, Color Grading, Motion Graphics, and more',
        'https://i3.ytimg.com/vi/u99i1SmDgIc/maxresdefault.jpg', 'Learn Adobe Premiere Pro CC', b'0'),
       (10015, 'Jacob Clifford', 'Finance', '15.99', '4.50',
        'The Easiest Beginner level Course on Economics with real life examples and graphic content. Perfect for Newbies!',
        'https://i3.ytimg.com/vi/g9aDizJpd_s/maxresdefault.jpg', 'Crash Course Economics', b'1'),
       (10016, 'MrandMrsMuscle', 'Health', '18.99', '3.50',
        'This course will help jump-start your body to lose belly fat, lose weight and guide you with a 14 day exercise plan. NO EQUIPMENT needed',
        'https://i3.ytimg.com/vi/By6GXzcldGY/maxresdefault.jpg', 'Lose Belly Fat in 14 Days', b'0'),
       (10017, 'Robert Kiyosaki', 'Real Estate', '21.99', '4.50',
        'Learn professional investment techniques for real estate investing in residential and commercial properties',
        'https://i3.ytimg.com/vi/UJv9-F7SN5A/maxresdefault.jpg', 'Real Estate Investing', b'1'),
       (10018, 'Bill Hilton', 'Music', '15.99', '4.50',
        'Learn Piano in WEEKS not years. Play-By-Ear & learn to Read Music. Pop, Blues, Jazz, Ballads, Classical',
        'https://i3.ytimg.com/vi/WJ3-F02-F_Y/maxresdefault.jpg', 'How To Play Piano for Beginners', b'1'),
       (10019, 'TTFS', 'Office', '17.99', '4.00',
        'Microsoft Excel Beginner to Professional. Includes Pivot Tables, Power Query, NEW Formulas',
        'https://i3.ytimg.com/vi/Vl0H-qTclOg/maxresdefault.jpg', 'Master Microsoft Excel', b'0');

--
-- Dumping data for table `course_objectives`
--

INSERT INTO `course_objectives` (`id`, `objective`, `course_id`)
VALUES (1, 'Be able to program in Python professionally', 10010),
       (2, 'Build GUIs and Desktop applications with Python', 10010),
       (3, 'Be able to build fully fledged websites and web apps with Python', 10010),
       (4, 'Create a portfolio of Python projects to apply for developer jobs', 10010),
       (5, 'Be able to build fully fledged websites and web apps with Python', 10010),
       (6, 'All about variables, functions, objects and arrays', 10011),
       (7, 'Modern ES6 from the beginning: arrow functions, destructuring, spread operator, optional chaining', 10011),
       (8, 'Project-driven learning with plenty of examples', 10011),
       (9, 'Asynchronous JavaScript: Event loop, promises, async/await, AJAX calls and APIs', 10011),
       (10, 'Complex concepts like the \'this\' keyword, higher-order functions, closures', 10011),
       (11, 'Learn industry best practices in Java software development from a professional', 10012),
       (12, 'Obtain proficiency in Java 8 and Java 11', 10012),
       (13, 'Be able to demonstrate your understanding of Java to future employers', 10012),
       (14, 'Acquire essential java basics for transitioning to the Spring Framework, Java EE, Android', 10012),
       (15, 'Master Exceptions, IO, Collections Framework, Generics, Multi-threading, Databases', 10012),
       (16, 'Master advanced Illustrator tools and techniques', 10013),
       (17, 'Design your own graphics, without any experience', 10013),
       (18, 'Create custom typography', 10013),
       (19, 'Take hand drawings and recreate them using Illustrator', 10013),
       (20, 'Export your projects for print, web, or other design projects', 10013),
       (21, 'Edit an entire video from beginning to end, using professional and efficient techniques', 10014),
       (22, 'Master Premiere Pro and be CONFIDENT Editing Your Own Videos', 10014),
       (23, 'Learn how to edit social media clips for Instagram, Facebook, Twitter & YouTube Stories', 10014),
       (24, 'How to organize your video editing footage like a Pro', 10014),
       (25, 'Add a feeling to your video with color grading', 10014),
       (26, 'Acquire a solid understanding of key economic relationships', 10015),
       (27, 'Understand business cycles', 10015),
       (28, 'Using demand and supply, illustrate price determination', 10015),
       (29, 'Examine the impact of tax/subsidies', 10015),
       (30, 'Decluttering and impact on economy', 10015),
       (31, 'Understand the fundamentals of weight loss', 10016),
       (32, 'Develop healthy eating habits', 10016),
       (33, 'Stay motivated for long term results', 10016),
       (34, 'Lose weight Naturally within 2 weeks', 10016),
       (35, 'Have a healthy relationship with food', 10016),
       (36, 'Confidently analyze multifamily real estate investment opportunities', 10017),
       (37, 'Use Professional Grade Investment Models to Evaluate Your Deals', 10017),
       (38, 'Use Smart Investment Deal Structures With Business Partners', 10017),
       (39, 'Evaluate Rental Income Properties', 10017),
       (40, 'Know a \"Good\" Investment from a \"Bad\" Investment', 10017),
       (41, 'You will learn to read sheet music AS you learn to play-by-ear', 10018),
       (42, 'You get to sound like a pro right from the start', 10018),
       (43, 'Learn to play the piano without theory', 10018),
       (44, 'Master unique tips & techniques that you won\'t find in ANY other course, guaranteed', 10019),
       (45, 'Build a solid understanding on the Basics of Microsoft Excel', 10019),
       (46, 'Maintain large sets of Excel data in a list or table', 10019),
       (47, 'Write advanced conditional, text, date and lookup functions, including XLOOKUP', 10019),
       (48, 'Get LIFETIME access to project files, quizzes, homework exercises', 10019),
       (49, 'Navigating the keyboard', 10018),
       (50, 'Basic improvisation', 10018);

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `length_seconds`, `lesson_name`, `position`, `videokey`, `course_id`)
VALUES (UUID_TO_BIN(UUID()), 455, '1. Introduction to Java', 1, '2dZiMBwX_5Q', 10012),
       (UUID_TO_BIN(UUID()), 323, '2. Installation and Hello World', 2, 'Hdf5OmERt0g', 10012),
       (UUID_TO_BIN(UUID()), 688, '3. Understanding Java Foundation', 3, 'ovb8njlzvlA', 10012),
       (UUID_TO_BIN(UUID()), 690, '4. Arguments and Parameters', 4, 'U5b9TH14REM', 10012),
       (UUID_TO_BIN(UUID()), 564, '5. Input and Output', 5, 'JceW6zvmA_Q', 10012),
       (UUID_TO_BIN(UUID()), 531, '6. Variables', 6, '7wWvSn_qiBc', 10012),
       (UUID_TO_BIN(UUID()), 507, '7. Primitives and Objects', 7, 'r4wWYgkBcpI', 10012),
       (UUID_TO_BIN(UUID()), 478, '8. Variable Declaration and Initialization', 8, '1mRN2MwdWUo', 10012),
       (UUID_TO_BIN(UUID()), 660, '9. Primitive Data Types', 9, 'qUXbJziVs_o', 10012),
       (UUID_TO_BIN(UUID()), 1320, 'DAY 1 - Lose Weight and Lose Belly Fat', 1, 'By6GXzcldGY', 10016),
       (UUID_TO_BIN(UUID()), 1311, 'DAY 2 - Lose Weight and Lose Belly Fat', 2, '4920WOvqqPQ', 10016),
       (UUID_TO_BIN(UUID()), 1338, 'DAY 3 - Lose Weight and Lose Belly Fat', 3, 'rqFYiJNOZjY', 10016),
       (UUID_TO_BIN(UUID()), 1329, 'DAY 4 - Lose Weight and Lose Belly Fat', 4, 'MnUflUjr2bw', 10016),
       (UUID_TO_BIN(UUID()), 1327, 'DAY 5 - Lose Weight and Lose Belly Fat', 5, 'lSZacNnqn7g', 10016),
       (UUID_TO_BIN(UUID()), 1317, 'DAY 6 - Lose Weight and Lose Belly Fat', 6, '2tHo7phAtfM', 10016),
       (UUID_TO_BIN(UUID()), 1313, 'DAY 7 - Lose Weight and Lose Belly Fat', 7, '0nhfE3q6ZA8', 10016),
       (UUID_TO_BIN(UUID()), 1315, 'DAY 8 - Lose Weight and Lose Belly Fat', 8, 'ex16_HWvYJM', 10016),
       (UUID_TO_BIN(UUID()), 1312, 'DAY 9 - Lose Weight and Lose Belly Fat', 9, 'mbNl_XaWjWQ', 10016),
       (UUID_TO_BIN(UUID()), 1318, 'DAY 10 - Lose Weight and Lose Belly Fat', 10, 'x9MJjko7vJM', 10016),
       (UUID_TO_BIN(UUID()), 208, '1. How to Get Started With JavaScript', 1, 'ItYye9h_RXg', 10011),
       (UUID_TO_BIN(UUID()), 268, '2. Which Tools to Use When Developing', 2, 'ns_L4kpxY8c', 10011),
       (UUID_TO_BIN(UUID()), 381, '3. How to Install Extensions For JavaScript Development', 3,
        'ZouJQRxgem0', 10011),
       (UUID_TO_BIN(UUID()), 499, '4. How to Include JavaScript in Our HTML', 4, 'AD5hxsFJc4o', 10011),
       (UUID_TO_BIN(UUID()), 382, '5. How to Use the Developer Tool for JavaScript Development', 5,
        'sjmyfwESv1g', 10011),
       (UUID_TO_BIN(UUID()), 338, '6. Rules for Writing JavaScript Code', 6, 'FdlBtidhAnE', 10011),
       (UUID_TO_BIN(UUID()), 537, '7. How to Create Variables in JavaScript', 7, '9aGIAL16DL4', 10011),
       (UUID_TO_BIN(UUID()), 880, '8. Different Data Types in JavaScript', 8, 'O9by2KcR2v4', 10011),
       (UUID_TO_BIN(UUID()), 288, '9. Different Types of Operators in JavaScript', 9, 'FZzyij43A54',
        10011),
       (UUID_TO_BIN(UUID()), 283, '10. String Operator in JavaScript Explained', 10, 'uli67N4Z03Y',
        10011),
       (UUID_TO_BIN(UUID()), 1137, '1. Preferences and Project Settings', 1, 'EFK-vhzvYDg', 10014),
       (UUID_TO_BIN(UUID()), 162, '2. Timeline Scroll: Page VS Smooth', 2, 'GRESV6TO5sA', 10014),
       (UUID_TO_BIN(UUID()), 562, '3. Scale or Set to Frame Size', 3, 'kh5wWqyG1KU', 10014),
       (UUID_TO_BIN(UUID()), 409, '4. Keyboard Shortcuts', 4, 'aJTn5pj2zZ0', 10014),
       (UUID_TO_BIN(UUID()), 766, '5. How to Setup a New Project', 5, 'Ud3ABhhJwb0', 10014),
       (UUID_TO_BIN(UUID()), 396, '6. Windows and Layouts', 6, 'J-XuNBVG_lg', 10014),
       (UUID_TO_BIN(UUID()), 607, '7. Importing Media Part 1', 7, 't7hGBgkOJDY', 10014),
       (UUID_TO_BIN(UUID()), 257, '8. Importing Media Part 2', 8, 'Y_aydeNr8l4', 10014),
       (UUID_TO_BIN(UUID()), 653, '9. The Project Panel', 9, 'UTtrFgapV_4', 10014),
       (UUID_TO_BIN(UUID()), 432, '10. The Source Panel', 10, 'J7xy5l6IsMk', 10014),
       (UUID_TO_BIN(UUID()), 1307, '1. Excel Basics Tutorial', 1, 'rwbho0CgEAE', 10019),
       (UUID_TO_BIN(UUID()), 1218, '2. Intermediate Excel Skills, Tips, and Tricks', 2, 'lxq_46nY43g',
        10019),
       (UUID_TO_BIN(UUID()), 718, '3. VLOOKUP Basics', 3, 'y8ygx1Zkcgs', 10019),
       (UUID_TO_BIN(UUID()), 791, '4. Creating Pivot Tables in Excel', 4, 'BkmxrvIfDGA', 10019),
       (UUID_TO_BIN(UUID()), 317, '5. Using Recommended Pivot Tables', 5, 'ebdgGbsTWs8', 10019),
       (UUID_TO_BIN(UUID()), 255, '6. Protecting a Sheet', 6, 'piIWTp3qncw', 10019),
       (UUID_TO_BIN(UUID()), 443, '7. Advanced Excel - 3D Formulas', 7, 'arJBUarj8u8', 10019),
       (UUID_TO_BIN(UUID()), 788, '8. Data Validation and Drop-Down Lists', 8, 'SlWIgMFpsPg', 10019),
       (UUID_TO_BIN(UUID()), 345, '9. Creating Your Own Excel Templates', 9, 'dgHjAHIBvsI', 10019),
       (UUID_TO_BIN(UUID()), 314, '10. Excel Split Names', 10, 'yCxnWvD_r_Q', 10019),
       (UUID_TO_BIN(UUID()), 698, '1. The Piano Keyboard', 1, 'QBH6IpRkVDs', 10018),
       (UUID_TO_BIN(UUID()), 1182, '2. Starting to Read Music', 2, '3BULT0-joT0', 10018),
       (UUID_TO_BIN(UUID()), 984, '3. Reading a Melody', 3, 'NUVQIwO1SEI', 10018),
       (UUID_TO_BIN(UUID()), 987, '4. The Left Hand And The Scale Of C Major', 4, 'f9JI_5y0K68', 10018),
       (UUID_TO_BIN(UUID()), 881, '5. Learning a Piece', 5, '1JVtPB8VJXE', 10018),
       (UUID_TO_BIN(UUID()), 796, '6. A New Piece, A New Scale, And Rests', 6, 'yeP2qRcHuUM', 10018),
       (UUID_TO_BIN(UUID()), 864, '7. Quavers (Eighth Notes) And Accidentals', 7, '3UetN01yPTs', 10018),
       (UUID_TO_BIN(UUID()), 749, '8. A New Piece, Phrase Marks And Ritenuto', 8, '7x20caWKKkQ', 10018),
       (UUID_TO_BIN(UUID()), 788, '9. The Concept Of Musical Key', 9, 'aU3VEy-4qwM', 10018),
       (UUID_TO_BIN(UUID()), 1114, '10. More Scales, And Playing Staccato', 10, 'ZCdfa9GyyuM', 10018),
       (UUID_TO_BIN(UUID()), 729, '1. Intro to Economics: Crash Course Economics', 1, '3ez10ADR_gM',
        10015),
       (UUID_TO_BIN(UUID()), 159, '2. Crash Course Economics- How it all started', 2, 'A307rSHkJdc',
        10015),
       (UUID_TO_BIN(UUID()), 543, '3. Specialization and Trade: Crash Course Economics', 3,
        'NI9TLDIPVcs', 10015),
       (UUID_TO_BIN(UUID()), 617, '4. Economic Systems and Macroeconomics: Crash Course Economics', 4,
        'B43YEW2FvDs', 10015),
       (UUID_TO_BIN(UUID()), 622, '5. Supply and Demand: Crash Course Economics', 5, 'g9aDizJpd_s',
        10015),
       (UUID_TO_BIN(UUID()), 823, '6. Macroeconomics: Crash Course Economics', 6, 'd8uTB5XorBw', 10015),
       (UUID_TO_BIN(UUID()), 530, '7. Productivity and Growth: Crash Course Economics', 7, 'UHiUYj5EA0w',
        10015),
       (UUID_TO_BIN(UUID()), 625, '8. Inflation and Bubbles and Tulips: Crash Course Economics', 8,
        'T8-85cZRI9o', 10015),
       (UUID_TO_BIN(UUID()), 713, '9. Fiscal Policy and Stimulus: Crash Course Economics', 9,
        'otmgFQHbaDo', 10015),
       (UUID_TO_BIN(UUID()), 451, '10. Deficits & Debts: Crash Course Economics', 10, '3sUCSGVYzI0',
        10015),
       (UUID_TO_BIN(UUID()), 928, '1. Install and Setup for Mac and Windows', 1, 'YYXdXT2l-Gg', 10010),
       (UUID_TO_BIN(UUID()), 1271, '2. Strings - Working with Textual Data', 2, 'k9TUPpGqYTo', 10010),
       (UUID_TO_BIN(UUID()), 715, '3. Integers and Floats - Working with Numeric Data', 3, 'khKv-8q7YmY',
        10010),
       (UUID_TO_BIN(UUID()), 1744, '4. Lists, Tuples, and Sets', 4, 'W8KRzm-HUcc', 10010),
       (UUID_TO_BIN(UUID()), 599, '5. Dictionaries - Working with Key-Value Pairs', 5, 'daefaLgNkw0',
        10010),
       (UUID_TO_BIN(UUID()), 988, '6. Conditionals and Booleans - If, Else, and Elif Statements', 6,
        'DZwmZ8Usvnk', 10010),
       (UUID_TO_BIN(UUID()), 614, '7. Loops and Iterations - For/While Loops', 7, '6iF8Xb7Z3wQ', 10010),
       (UUID_TO_BIN(UUID()), 1307, '8. Functions', 8, '9Os0o3wzS_I', 10010),
       (UUID_TO_BIN(UUID()), 1317, '9. Import Modules and Exploring The Standard Library', 9,
        'CqvZ3vGoGs0', 10010),
       (UUID_TO_BIN(UUID()), 1562, '10. Setting up a Python Development Environment in Sublime Text', 10,
        'xFciV6Ew5r4', 10010),
       (UUID_TO_BIN(UUID()), 866, '1. Interface Introduction to Adobe Illustrator', 1, 'QKWnkIPur2Q',
        10013),
       (UUID_TO_BIN(UUID()), 552, '2. Panels & Workspaces in Adobe Illustrator', 2, '2E9oGKd0Ayg',
        10013),
       (UUID_TO_BIN(UUID()), 579, '3. Artboards in Adobe Illustrator', 3, '9GbLm_WXWwk', 10013),
       (UUID_TO_BIN(UUID()), 1033, '4. Vector basics | Selection & Direct selection tool & more', 4,
        'GFY0_EMVYDw', 10013),
       (UUID_TO_BIN(UUID()), 651, '5. Fill & Stroke effects in Adobe Illustrator', 5, 'xhATZA88zC4',
        10013),
       (UUID_TO_BIN(UUID()), 1067, '6. Using Colour | Swatches | Pantone\'s | Gradients & more', 6,
        'MX67tVC8f3s', 10013),
       (UUID_TO_BIN(UUID()), 716, '7. 10 Handy Tips | Things to know for beginners', 7, 'wRL9rPO2SYk',
        10013),
       (UUID_TO_BIN(UUID()), 1129, '8. Creating shape vectors in Adobe Illustrator', 8, 'FH4-WIkHnd4',
        10013),
       (UUID_TO_BIN(UUID()), 901, '9. Grouping | Compounding vectors & Using the shape builder tool', 9,
        'aGFWmYHUQOU', 10013),
       (UUID_TO_BIN(UUID()), 483, '10. The Blob brush tool & Eraser tool in Adobe Illustrator', 10,
        'wnXDboK7FH8', 10013),
       (UUID_TO_BIN(UUID()), 344, 'Part 1 - Real Estate Investing', 1, 'nFH8PV_jPLk', 10017),
       (UUID_TO_BIN(UUID()), 452, 'Part 2 - Real Estate Investing', 2, 'dgu5PaLFu5Y', 10017),
       (UUID_TO_BIN(UUID()), 261, 'Part 3 - Real Estate Investing', 3, '4c6afHE7P6M', 10017),
       (UUID_TO_BIN(UUID()), 1880, 'Part 4 - Real Estate Investing', 4, 'mRzoImyFMSY', 10017),
       (UUID_TO_BIN(UUID()), 896, 'Part 5 - Real Estate Investing', 5, '1mecyBhnJKg', 10017);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
