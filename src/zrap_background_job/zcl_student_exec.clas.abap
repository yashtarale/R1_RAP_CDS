CLASS zcl_student_exec DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_apj_rt_exec_object.
    INTERFACES if_apj_dt_exec_object.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_student_exec IMPLEMENTATION.
  METHOD if_apj_rt_exec_object~execute.

    "This runs in background

    DATA(ls_student) = VALUE zstudent_bgpf( roll_number = '101' name = 'John Doe' ).
    INSERT zstudent_bgpf FROM @ls_student.


    DATA(lss_student) = VALUE zstudent_bgpf( roll_number = '102' name = 'Yash T' ).
    INSERT zstudent_bgpf FROM @lss_student.

  ENDMETHOD.

  METHOD if_apj_dt_exec_object~get_parameters.
*OPTIONAL
  ENDMETHOD.

ENDCLASS.
