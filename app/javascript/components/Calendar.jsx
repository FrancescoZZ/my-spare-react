import React, { useState, useEffect } from 'react'
import { DateRange } from 'react-date-range'

const Calendar = ({ setDates }) => {
  const [state, setState] = useState([
    {
      startDate: null,
      endDate: new Date(""),
      key: 'selection'
    }
  ]);

  useEffect(() => {
    setDates({state})
  }, [state]);

  return(
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
    />
  )
}

export default Calendar
