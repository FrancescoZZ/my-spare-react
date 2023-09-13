import React, { useState, useEffect } from 'react'
import axios from 'axios'
import Calendar from './Calendar'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faCalendar } from '@fortawesome/free-regular-svg-icons'
import { faCalendarXmark } from '@fortawesome/free-regular-svg-icons'

const Search = ({ setInstruments }) => {
  const [query, setQuery] = useState("");
  const [dates, setDates] = useState({});

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
            <FontAwesomeIcon icon={faCalendar} />
            <FontAwesomeIcon icon={faCalendarXmark} />
          </div>
        </div>
        <Calendar setDates={setDates} />
      </form>
    </>
  )
}

export default Search

