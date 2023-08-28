import React, { useState, useEffect} from 'react'

const Instrument = (props) => {
  const [instrument, setInstrument] = useState({})
  const [bookings, setBookings] = useState({})

  useEffect(()=>{
    console.log(props)
  }, [])

  return (
    <div>
      This is the Instruments#show view
    </div>
  )
}

export default Instrument

