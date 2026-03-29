CLASS lhc_ZI_STUDENT_BG DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_student_bg RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zi_student_bg RESULT result.

    METHODS trigger_bg_job FOR MODIFY
      IMPORTING keys FOR ACTION zi_student_bg~trigger_bg_job.

ENDCLASS.

CLASS lhc_ZI_STUDENT_BG IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD trigger_bg_job.
    "Schedule background job
    DATA: lv_jobname  TYPE cl_apj_rt_api=>ty_jobname,
          lv_jobcount TYPE cl_apj_rt_api=>ty_jobcount.

    DATA(ls_start_info) = VALUE cl_apj_rt_api=>ty_start_info( start_immediately = abap_true ).

    TRY.
        cl_apj_rt_api=>schedule_job(
          EXPORTING
            iv_job_template_name = 'Z_STUDENT_TEMPLATE'
            iv_job_text = 'Job_text'
            is_start_info = ls_start_info

          IMPORTING
            ev_jobname           = lv_jobname
            ev_jobcount          = lv_jobcount
        ).
      CATCH cx_apj_rt.
        "handle exception
    ENDTRY.
  ENDMETHOD.

ENDCLASS.
