const mongoose = new require("mongoose");

const ParticipantSchema = require("./participant.model");
const QuestionSchema = require("./question.model");

const AdminSchema = mongoose.Schema(
  {
    adminName: {
      type: String,
      required: true,
      unique: true
    },
    socketID: {
      type: String,
    },
    roomId: {
      type: String,
      unique: true,
      required: true,
    },
    questions: [QuestionSchema],
    participants: [ParticipantSchema],
    isJoin: {
      type: Boolean,
      default: true
    },

  }
)

const Admin = mongoose.model("Admin", AdminSchema);

module.exports = Admin;