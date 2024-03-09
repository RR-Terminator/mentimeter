const mongoose = require("mongoose");
const { Schema } = mongoose;

const Admin = require("./admin.model");

const QuestionSchema = new Schema(
  {
    question: {
      type: String,
      required: true,
    },
    options: [
      {
        type: String,
        required: true,
      },
    ],
    correctOption: {
      type: String,
      required: true,
    },
  },
  {
    timestamps: true,
  }
);

module.exports = QuestionSchema;