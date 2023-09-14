import React, { useState, useEffect, forwardRef, useImperativeHandle } from 'react'
import { DateRange } from 'react-date-range'

const Calendar = forwardRef(({ setDates, calendarHidden, resetCalendar }, ref) => {
  const initialState = [
    {
      startDate: null,
      endDate: new Date(""),
      key: 'selection'
    }
  ] 
  const [state, setState] = useState(initialState);

  useImperativeHandle(ref, () => ({
    resetCalendar() {
      setState(initialState) 
    }
  }));

  useEffect(() => {
    setDates({state})
  }, [state]);

  return(
    <div style={{position: "absolute", right: 12, zIndex: 10, boxShadow: "0px 8px 16px 0px rgba(0,0,0,0.2)"}}>
      <DateRange
        editableDateInputs={false}
        onChange={(item) => {
          setState([item.selection])
        }}
        moveRangeOnFirstSelection={false}
        ranges={state}
        minDate={new Date()}
        startDatePlaceholder={"Start date"}
        endDatePlaceholder={"End date"}
        className={calendarHidden ? "d-none" : ""}
      />
    </div>
  )
});

export default Calendar
