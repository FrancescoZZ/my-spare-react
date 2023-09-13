import React, { useState, useEffect } from 'react'
import axios from 'axios'
import Instrument from './Instrument'
import Calendar from '../Calendar'
import Search from '../Search'

const Instruments = () => {
  const [instruments, setInstruments] = useState([])

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
    <>
      <Search setInstruments={setInstruments}/>
      <div className="row justify-content-center">
        {grid}
      </div>
    </>
  )
}

export default Instruments
