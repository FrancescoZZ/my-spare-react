import React, { useState, useEffect } from 'react'
import axios from 'axios'

const Search = ({ setInstruments }) => {
  const [query, setQuery] = useState("");

  useEffect(() => {
    fetchData(query);
  }, []);

  const fetchData = (value) => {
    axios.get('/api/v1/instruments.json', {
      params: {
        query: value
      }
    }).then(resp => setInstruments(resp.data.data));
  }

  const handleChange = (value) => {
    setQuery(value);
    fetchData(value);
  }

  return(
    <>
      <form action="">
        <input
          type="text"
          className="form-control"
        placeholder="Search for instruments..."
        value={query}
        onChange={(e) => handleChange(e.target.value)}/>
      </form>
    </>
  )
}

export default Search

