import React, { useState, useEffect} from 'react'
import { useParams } from 'react-router-dom';
import axios from 'axios'

const Instrument = (props) => {
  const [instrument, setInstrument] = useState({})
  const [bookings, setBookings] = useState({})
  const [loaded, setLoaded] = useState(false)
  const id = useParams().id
  const url = `/api/v1/instruments/${id}`

  useEffect(()=>{
    axios.get(url)
    .then( resp => {
        setInstrument(resp.data.data.attributes) 
        setLoaded(true)
        console.log(resp.data.data.attributes)
      })
    .catch( resp => console.log(resp) )
  }, [])

  return (
    <div className="row">
      <div className="col-xl-4">
        <h2>{instrument.model}</h2>
        <img src={instrument.image_url} alt={instrument.model} className="rounded" style={{height: 400}}/>
        { (instrument.category || instrument.brand) &&
          <>
            <hr />
            { instrument.category && 
              <>
                <strong>Category:</strong> {instrument.category}<br />
              </>
            }
            { instrument.brand && 
              <>
                <strong>Brand:</strong> {instrument.brand}<br />
              </>
            }
          </>
        }
        { instrument.description &&
          <>
            <hr />
            <p>{instrument.description}</p>
          </>
        }
      </div>
    </div>
  )
}

export default Instrument

