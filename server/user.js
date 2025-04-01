const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

const express = require("express");
const userRouter = express.Router()
const bcryptjs = require("bcryptjs")

userRouter.post("/signUp", async (req, res) => {
    try {
        const { name, email, password } = req.body;

        const hashedPassword = await bcryptjs.hash(password, 10);

        const user = await prisma.user.create({
            data: {
                name,
                email,
                password: hashedPassword
            }
        });
        return res.json(user);
    } catch (error) {
        return res.status(500).json({ error: error.message });
    }
});

userRouter.post("/signIn", async (req, res) => {
    try {

        const { email, password } = req.body;
        const user = await prisma.user.findUnique({
            where: {
                email
            }
        });

        if (!user) {
            return res.status(404).json({ error: "User not found" });
        }
        const isPasswordMatch = await bcryptjs.compare(password, user.password);
        if (!isPasswordMatch) {
            return res.status(401).json({ error: "Invalid password" });
        }
        return res.json(user);
    } catch (error) {
        return res.status(500).json({ error: error.message });
    }
})


module.exports = userRouter