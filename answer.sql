-- SELECT
 -- ES 1

SELECT *
FROM `students`
WHERE YEAR(`date_of_birth`) = 1990;

-- ES 2

SELECT *
FROM `courses`
WHERE `cfu` > 10;

-- ES 3

SELECT *
FROM `students`
WHERE (DATEDIFF(NOW(), `date_of_birth`) / 365) > 30;

-- ES 4

SELECT *
FROM `courses`
WHERE `period` = 'I Semestre'
    AND `year` = 1;

-- ES 5

SELECT *
FROM `exams`
WHERE `date` = '2020-06-20'
    AND HOUR(`hour`) >= 14;

-- ES 6

SELECT *
FROM `degrees`
WHERE `level` LIKE 'magistrale';

-- ES 7

SELECT COUNT(*) AS `department_n`
FROM `departments`;

-- ES 8

SELECT *
FROM `teachers`
WHERE `phone` IS NULL;

-- GROUP BY
-- ES 1

SELECT COUNT(*) as `subscriptions`,
       YEAR(`enrolment_date`) as `year`
FROM `students`
GROUP BY YEAR(`enrolment_date`);

-- ES 2

SELECT COUNT(*) as `n_teachers`,
       `office_address`
FROM `teachers`
GROUP BY `office_address`;

-- ES 3

SELECT AVG(`vote`) as `avg_vote`,
       `exam_id`
FROM `exam_student`
GROUP BY `exam_id`;

-- ES 4

SELECT COUNT(*) as `n_courses`,
       `department_id`
FROM `degrees`
GROUP BY `department_id`;

