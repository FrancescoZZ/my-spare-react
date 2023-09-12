import React, { useState } from 'react'
import { DateRange } from 'react-date-range'

const Calendar = () => {
  const [state, setState] = useState([
    {
      startDate: null,
      endDate: new Date(""),
      key: 'selection'
    }
  ]);

  return(
    <DateRange
      editableDateInputs={true}
      onChange={item => setState([item.selection])}
      moveRangeOnFirstSelection={false}
      ranges={state}
      minDate={new Date()}
      startDatePlaceholder={"Start date"}
      endDatePlaceholder={"End date"}
    />
  )
}

export default Calendar
