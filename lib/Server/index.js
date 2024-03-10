const express = require("express");
const http = require("http");
const mongoose = require("mongoose");



const app = express();
const port = process.env.port || 3000;
var server = http.createServer(app);
app.use(express.json());
var io = require("socket.io")(server);


// Import your models

const Admin = require("./Models/admin.model");


// Data base connection:-
const DB =
    "mongodb+srv://Rahul:rahul123@cluster0.sspnvba.mongodb.net/?retryWrites=true&w=majority";

mongoose
    .connect(DB, { useNewUrlParser: true, useUnifiedTopology: true })
    .then(() => {
        console.log("Connection Successful");
    })
    .catch((e) => {
        console.log(e);
    });



server.listen(port, "0.0.0.0", () => {
    console.log("Server started and running on Port " + port);
});



// io Connections :- 

io.on("connection", (socket) => {
    console.log("a user connected");

    //Function to create an Admin :-

    socket.on("createQuest", async ({ AdminName }) => {
        console.log(AdminName);
        const roomId = await generateUniqueRoomId();
        try {
            const admin = new Admin({
                adminName: AdminName,
                socketID: socket.id,
                isJoin: true,
                roomId: roomId,
            });
            const savedAdmin = await admin.save();
            console.log("Admin created:", savedAdmin);
            console.log(savedAdmin._id);
            socket.emit('RoomCreated', savedAdmin)
        } catch (error) {
            console.error("Error creating Admin:", error.message);
        }
    });

    // Function to add a Question
    socket.on(
        "addQuestion",
        async ({ question, Options, correctOption }) => {
            const adminModel = mongoose.model("Admin");
            const admin = await adminModel.findOne({ socketID: socket.id });

            try {
                if (!admin) {
                    console.error("Admin not found");
                    return;
                }

                let newQuestion = {
                    question: question,
                    options: Options,
                    correctOption: correctOption,
                    createdBy: admin._id, // Use the ObjectId of the found admin
                };

                admin.questions.push(newQuestion);

                console.log("Question added:", newQuestion);

                await admin.save();

                console.log(admin)

                socket.emit('RoomCreated', admin)

            } catch (error) {
                console.error("Error adding Question:", error.message);
            }

        }
    );



    // Participant Joining the Room

    socket.on("joinRoom", async ({ UserName, roomId }) => {
        console.log(UserName, roomId);
        const admin = await Admin.findOne({ roomId: roomId });
        try {
            if (!admin || !admin.isJoin) {
                console.error("Room not found");
            }
            let participant = {
                userName: UserName, // Fix typo: change AdminName to UserName
                socketID: socket.id,
                isJoined: true,
            }
            admin.participants.push(participant);
            await admin.save();
            console.log("Participant created:", participant);
            socket.emit('PlayerJoined', admin)
            console.log(admin);
        } catch (error) {
            console.log("Error creating Participant:", error.message);
        }
    });

});


// Function To Create Unique RoomId
function generateUniqueRoomId() {
    const newRoomId = Math.random().toString(36).substring(2, 7);

    return Admin.exists({ roomId: newRoomId }).then((exists) => {
        if (exists) {
            return generateUniqueRoomId();
        }
        return newRoomId;
    });
}

