import React, { useState, useEffect, useRef } from 'react'
import axios from 'axios'
import Calendar from './Calendar'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faCalendar } from '@fortawesome/free-regular-svg-icons'
import { faCalendarXmark } from '@fortawesome/free-regular-svg-icons'

const Search = ({ setInstruments }) => {
  const [query, setQuery] = useState("");
  const [dates, setDates] = useState({});
  const [calendarHidden, setCalendarHidden] = useState(true);
  const ref = useRef();

  useEffect(() => {
    const params = {
      query: query
    }
    if(dates.state && (dates.state[0].startDate instanceof Date) && (dates.state[0].endDate instanceof Date)){
      params.dates = dates.state[0]
    }
    fetchData(params)
  }, [dates, query]);

  const fetchData = (params) => {
    axios.get('/api/v1/instruments.json', {
      params: params
    }).then(resp => setInstruments(resp.data.data));
  }

  const toggleCalendar = () => setCalendarHidden(!calendarHidden);

  return(
    <>
      <form action="">
        <div className="input-group">
          <input
            type="text"
            className="form-control"
            placeholder="Search for instruments..."
            value={query}
            onChange={(e) => setQuery(e.target.value)}/>
          <div className="input-group-append">
            <div className="btn btn-dark" style={{borderRadius: 0}} title="Toggle Calendar" onClick={toggleCalendar}>
              <FontAwesomeIcon icon={faCalendar} color="white" />
            </div>
          </div>
          <div>
            <div className="btn btn-dark" style={{borderTopLeftRadius: 0, borderBottomLeftRadius: 0}} title="Reset Calendar" onClick={() => ref.current.resetCalendar()}>
              <FontAwesomeIcon icon={faCalendarXmark} color="white" />
            </div>
          </div>
        </div>
      </form>
      <Calendar setDates={setDates} calendarHidden={calendarHidden} ref={ref} />
    </>
  )
}

export default Search

