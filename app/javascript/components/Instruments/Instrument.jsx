import React, { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'

const Instrument = (props) => {
  return (
    <div className="card p-0 m-2 border-0" style={{ width: 300 }}>
      <img src={props.attributes.image_url} alt={props.attributes.model} className="card-img-top rounded mx-auto" style={{ width: 300, height: 300, overflow: "hidden", objectFit: "cover" }} />
      <h5 className="card-title mb-1">{props.attributes.model}</h5>
      <div className="card-text">
        <div className="d-flex col justify-content-between">
          <span>{props.attributes.brand}</span>
          <span>{props.attributes.category}</span>
        </div>
        <div className="d-flex col justify-content-between">
          <span><strong>{Math.floor(props.attributes.daily_price)}€</strong>/day</span>
          <span>2km</span>
        </div>
      </div>
      <Link to={`/instruments/${props.id}`} className="stretched-link" />
    </div>
  )
}

export default Instrument
