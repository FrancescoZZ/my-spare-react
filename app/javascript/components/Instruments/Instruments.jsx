import React, { useState, useEffect } from 'react'
import axios from 'axios'
import Instrument from './Instrument'
import Calendar from '../Calendar'

const Instruments = () => {
  const [instruments, setInstruments] = useState([])

  useEffect(() => {
    axios.get('/api/v1/instruments.json')
    .then(resp => setInstruments(resp.data.data))
    .catch(resp => console.log(resp))
  }, [instruments.length])

  const grid = instruments.map( item => {
    return(
      <Instrument 
        key={item.attributes.model}
        attributes={item.attributes}
        id={item.id}
      />
      )
  })

  return (
    <div>
      <Calendar />
      <div className="row justify-content-center">
        {grid}
      </div>
    </div>
  )
}

export default Instruments
