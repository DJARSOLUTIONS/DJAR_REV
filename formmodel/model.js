const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const StartupSchema = new Schema({
  startupName: { type: String, required: true },
  startupDomain: { type: String, required: true },
  ownerName: { type: String, required: true },
  ownerEmail: { type: String, required: true },
  ownerPhone: { type: String, required: true },
  startupDetails: { type: String, required: true },
  imageData: { type: Buffer }, // Store image data directly as Buffer
  fundingGoal: { type: Number },
  pitchVideo: { type: String },
  prototypeLink: { type: String },
}, { timestamps: true }); // Add timestamps for creation/update

module.exports = mongoose.model('model', StartupSchema);
