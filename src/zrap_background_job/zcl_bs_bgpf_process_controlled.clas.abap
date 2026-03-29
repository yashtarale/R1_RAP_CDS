CLASS zcl_bs_bgpf_process_controlled DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  InterFACES if_bgmc_op_single.

  methods constructor
    impoRTING it_data tyPE ZCL_BS_BGPF_DATA=>tt_data.  "got the data from the BGPF_data class

  PROTECTED SECTION.

  PRIVATE SECTION.
      DATA mt_data TYPE zcl_bs_demo_bgpf_data=>tt_data.
ENDCLASS.



CLASS zcl_bs_bgpf_process_controlled IMPLEMENTATION.
  METHOD constructor.
    mt_data = it_data.  " private variable = same data
  ENDMETHOD.

  METHOD if_bgmc_op_single~execute.
  daTA(lo_table) = new zcl_bs_bgpf_data(  ).
*      " Optional
*    cl_abap_tx=>modify( ).

    loop at mt_data into data(ls_data).
    TRY.
        lo_table->add( ls_data ).
      CATCH cx_uuid_error.
        "handle exception
    ENDTRY.
    endloop.

    cl_abap_tx=>save(  ).
    lo_table->save( abap_false ).

  ENDMETHOD.

ENDCLASS.
