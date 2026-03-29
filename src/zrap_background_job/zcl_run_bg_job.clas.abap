CLASS zcl_run_bg_job DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  interfaces if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_run_bg_job IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA lt_keys TYPE TABLE FOR ACTION IMPORT zi_student_bg~trigger_bg_job.

    lt_keys = VALUE #(
      ( %key-roll_number = '0001' )
    ).

    MODIFY ENTITIES OF zi_student_bg
      ENTITY ZI_STUDENT_BG
      EXECUTE trigger_bg_job
      FROM lt_keys
      FAILED DATA(ls_failed)
      REPORTED DATA(ls_reported).

    COMMIT ENTITIES.

  ENDMETHOD.

ENDCLASS.
