import React from 'react'
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom'
import Instruments from './Instruments/Instruments'
import Instrument from './Instrument/Instrument'

const App = () => {
  return (
    <div className="container" style={{position: "relative"}}>
      <h1 className="mt-2 mb-4">mySpare</h1>
      <Router>
        <Routes>
          <Route exact path="/" element={<Instruments/>} />
          <Route exact path="/instruments/:id" element={<Instrument/>}/>
        </Routes>
      </Router>
    </div>
  )
  
}

export default App;
