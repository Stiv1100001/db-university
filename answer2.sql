--JOIN
-- ES 1

SELECT *
FROM `students`
JOIN `degrees`ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia";

--ES 2

SELECT *
FROM `degrees`
JOIN `departments` on `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` = 'Dipartimento di Neuroscienze';

-- ES 3

SELECT *
FROM `courses`
JOIN `course_teacher` ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `teachers` ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `teachers`.`id` = 44;

-- ES 4

SELECT `students`.`surname`,
       `students`.`name`,
       `degrees`.*,
       `departments`.`name` AS `department_name`
FROM `students`
JOIN `degrees` ON `students`.`degree_id` = `degrees`.`id`
JOIN `departments` ON `degrees`.`department_id` = `departments`.`id`
ORDER BY `students`.`surname` ASC,
         `students`.`name` ASC;

-- ES 5

SELECT `degrees`.`name` AS `degree_name`,
       `courses`.*,
       CONCAT(`teachers`.`surname`, ' ', `teachers`.`name`) AS `teacher`
FROM `degrees`
JOIN `courses` ON `courses`.`degree_id` = `degrees`.`id`
JOIN `course_teacher`ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers` ON `course_teacher`.`teacher_id` = `teachers`.`id`;

-- ES 6

SELECT DISTINCT `teachers`.*
FROM `teachers`
JOIN `course_teacher` ON `teachers`.`id` = `course_teacher`.`teacher_id`
JOIN `courses` ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `degrees` ON `courses`.`degree_id` = `degrees`.`id`
JOIN `departments` ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` = "Dipartimento di Matematica";

-- ES 7

SELECT CONCAT(`students`.`surname`, ' ', `students`.`name`) AS `student`,
       COUNT(`exam_student`.`vote`) AS `tries`,
       `courses`.`name` AS `course_name`
FROM `students`
JOIN `exam_student` ON `students`.`id` = `exam_student`.`student_id`
JOIN `exams` ON `exam_student`.`exam_id` = `exams`.`id`
JOIN `courses` ON `exams`.`course_id` = `courses`.`id`
GROUP BY `students`.`id`,
         `courses`.`id`;

