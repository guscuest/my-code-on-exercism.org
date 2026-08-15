CLASS zcl_itab_aggregation DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_numbers_type,
             group  TYPE group,
             number TYPE i,
           END OF initial_numbers_type,
           initial_numbers TYPE STANDARD TABLE OF initial_numbers_type WITH EMPTY KEY.

    TYPES: BEGIN OF aggregated_data_type,
             group   TYPE group,
             count   TYPE i,
             sum     TYPE i,
             min     TYPE i,
             max     TYPE i,
             average TYPE f,
           END OF aggregated_data_type,
           aggregated_data TYPE STANDARD TABLE OF aggregated_data_type WITH EMPTY KEY.

    DATA: i_register TYPE initial_numbers_type,
          a_register TYPE aggregated_data_type.        

    METHODS perform_aggregation
      IMPORTING
        initial_numbers        TYPE initial_numbers
      RETURNING
        VALUE(aggregated_data) TYPE aggregated_data.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_itab_aggregation IMPLEMENTATION.
  METHOD perform_aggregation.

    LOOP AT initial_numbers INTO i_register.

      READ TABLE aggregated_data ASSIGNING FIELD-SYMBOL(<group>)
        WITH KEY group = i_register-group.

      IF sy-subrc <> 0.

        APPEND VALUE #(
          group = i_register-group
          count = 1
          sum   = i_register-number
          min   = i_register-number
          max   = i_register-number
          average = i_register-number
        ) TO aggregated_data.

      ELSE.

        <group>-count = <group>-count + 1.
        <group>-sum   = <group>-sum + i_register-number.
        <group>-average = <group>-sum / <group>-count.

        IF i_register-number < <group>-min.
          <group>-min = i_register-number.
        ENDIF.

        IF i_register-number > <group>-max.
          <group>-max = i_register-number.
        ENDIF.        

      ENDIF.

    ENDLOOP.    

  ENDMETHOD.
  
ENDCLASS.