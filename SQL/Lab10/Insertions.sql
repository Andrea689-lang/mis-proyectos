CREATE TABLE classlist (
    student_id  NUMBER NOT NULL,
    course_id   NUMBER NOT NULL,
    grade       NUMBER,
    course_id1  NUMBER NOT NULL,
    student_id1 NUMBER NOT NULL
);

COMMENT ON COLUMN classlist.student_id IS
    'Primary key in the Classlist table.';

COMMENT ON COLUMN classlist.course_id IS
    'Primary key in the classlist table.';

ALTER TABLE classlist ADD CONSTRAINT classlist_pk PRIMARY KEY ( student_id,
                                                                course_id );

CREATE TABLE course (
    course_id   NUMBER NOT NULL,
    course_name VARCHAR2(20)
);

ALTER TABLE course ADD CONSTRAINT course_pk PRIMARY KEY ( course_id );

CREATE TABLE student (
    student_id   NUMBER NOT NULL,
    student_name VARCHAR2(20)
);

COMMENT ON COLUMN student.student_id IS
    'Primary key in the Student table.';

COMMENT ON COLUMN student.student_name IS
    'Full name of the stidemt';

ALTER TABLE student ADD CONSTRAINT student_pk PRIMARY KEY ( student_id );

ALTER TABLE classlist
    ADD CONSTRAINT classlist_course_fk FOREIGN KEY ( course_id1 )
        REFERENCES course ( course_id );

ALTER TABLE classlist
    ADD CONSTRAINT classlist_student_fk FOREIGN KEY ( student_id1 )
        REFERENCES student ( student_id );