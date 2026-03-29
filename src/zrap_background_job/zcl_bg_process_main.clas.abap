CLASS zcl_bg_process_main DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

    METHODS run_controlled_process
      RETURNING VALUE(rd_result) TYPE string.

    METHODS wait_and_log
      IMPORTING io_out    TYPE REF TO if_oo_adt_classrun_out
                id_string TYPE string.
*        RAISING cx_bmgc.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bg_process_main IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    out->write( 'start controlled job process' ).
    DATA(ld_string) = run_controlled_process(  ).

    wait_and_log( io_out = out
                  id_string = ld_string ).

  ENDMETHOD.

  METHOD run_controlled_process.
    DATA lo_operation TYPE REF TO if_bgmc_op_single.

    DATA(lt_data) = VALUE zcl_bs_demo_bgpf_data=>tt_data(                             "----- 1
       ( description = 'Control 1' inumber = 12 amount = '12.54' currency = 'EUR' )
       ( description = 'Control 2' inumber = 95 amount = '0.21' currency = 'USD' )
       ( description = 'Control 3' inumber = 547 amount = '145.50' currency = 'EUR' ) ).

    lo_operation = NEW zcl_bs_demo_bgpf_process_contr( lt_data ).                     "------2

    TRY.
        DATA(lo_process) = cl_bgmc_process_factory=>get_default(  )->create(  ).
        lo_process->set_name( 'controlled Process' )->set_operation( lo_operation ).

        DATA(lo_process_monitor) = lo_process->save_for_execution( ).
        COMMIT WORK.

        RETURN lo_process_monitor->to_string( ).

      CATCH cx_bgmc.
        ROLLBACK WORK.
    ENDTRY.
  ENDMETHOD.

  METHOD wait_and_log.
    TRY.
        data(lo_process_monitor) = cl_bgmc_process_factory=>create_monitor_from_string( id_string ).
      CATCH cx_bgmc.
        "handle exception
    ENDTRY.

    DO.
      IF sy-index = 60.
        EXIT.
      ENDIF.
      TRY.
          data(ld_state) = lo_process_monitor->get_state( ).
        CATCH cx_bgmc.
          "handle exception
      ENDTRY.

      io_out->write( ld_state ).
      io_out->write( utclong_current( ) ).

      IF    ld_state = if_bgmc_process_monitor=>gcs_state-successful
         OR ld_state = if_bgmc_process_monitor=>gcs_state-erroneous.
        EXIT.
      ENDIF.

      WAIT UP TO 1 SECONDS.
    ENDDO.
  ENDMETHOD.

ENDCLASS.
