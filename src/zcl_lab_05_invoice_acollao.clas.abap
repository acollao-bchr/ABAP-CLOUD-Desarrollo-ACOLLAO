CLASS zcl_lab_05_invoice_acollao DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_05_invoice_acollao IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "1 Overlay
    DATA: lv_sale        TYPE string VALUE 'Purchase Completed',
          lv_sale_status TYPE string VALUE 'Invoice'.

    OVERLAY lv_sale WITH lv_sale_status.
    out->write( lv_sale_status ).



*2. Función SUBSTRING

    DATA(lv_result) = 'AP-ABAP-32-PE'.
    out->write( lv_result ).
    out->write( | { substring(  val = lv_result off = 9 ) } | ).
    out->write( | { substring(  val = lv_result off = 0 len = 3 ) } | ).
    out->write( | { substring_from(  val = lv_result sub = 'abap' ) } | ).


*3.2. FIND

    DATA: lv_status TYPE string VALUE 'INVOICE GENERATED SUCCESSFULLY',
          lV_count  TYPE i.


*"Buscar la posición de cualquiera de los caracteres de 'GEN'.

    lv_status = find_any_of( val = lv_status sub = 'GEN' ).
    lv_count = sy-fdpos + 1.

    out->write( lv_count ).

    FIND ALL OCCURRENCES OF 'a' IN lv_status MATCH COUNT lv_count IGNORING CASE.
    out->write( lv_count ).

*4. REPLACE

    DATA(lv_request) = 'AP-ABAP-32-PE'.
    REPLACE ALL OCCURRENCES OF '-' IN lv_request WITH '/'.
    out->write( lv_request ).

**5. PCRE Regex
*
*    DATA:lv_regex TYPE string VALUE '^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$',
*         lv_email TYPE string VALUE 'acolla@ochr.cl'.
*
*
*    FIND PCRE lv_regex IN lv_email.
*
*    IF sy-subrc = 0.
*
*      out->write( 'Correo correcto' ).
*    ELSE.
*      out->write( 'registre un correo valido' ).
*endif.
*lv_regex

    DATA(lv_idcustome) = '0000012345'.
    DATA(lv_regex) =  '0*'.

    REPLACE ALL OCCURRENCES OF '0' IN lv_idcustome WITH space.
    out->write( lv_idcustome ).

  ENDMETHOD.

ENDCLASS.
