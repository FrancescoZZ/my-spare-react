import React from "react"
import PropTypes from "prop-types"
import App from "./App"
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom'

const Home = () => {
  return (
    <Router>
      <Routes>
        <Route exact path="/" element={<App/>}/>
      </Routes>
    </Router>
  )
}

export default Home
