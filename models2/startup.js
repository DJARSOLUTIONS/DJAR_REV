// startup.js

const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
  name: {
    type: String,
    required: [true, 'Please add a name'],
  },
  email: {
    type: String,
    required: [true, 'Please add an email'],
    unique: true,
  },
  password: {
    type: String,
    required: [true, 'Please add a password'],
  },
 phone:{
    type: Number,
    required: [true, 'Please add a phone number'],
  } 
}, { timestamps: true });

module.exports = mongoose.model('startup', userSchema);
//STARTUPS