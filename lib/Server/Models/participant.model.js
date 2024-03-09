const mongoose = new require("mongoose");


const ParticipantSchema = mongoose.Schema(
    {
        userName: {
            type: String,
            unique: true,
            required: true,
            trim: true,
        },
        socketID: {
            type: String,
            required: true,
        },
        isJoined: {
            required: true,
            type: Boolean,
            default: false,
        },
        points: {
            type: Number,
            default: 0,
        }
    },

)




module.exports = ParticipantSchema;