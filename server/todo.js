
const express = require("express");
const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

const todoRouter = express.Router();

todoRouter.post("/createTodos", async (req, res) => {
    try {
        console.log('Received body:', req.body); // 👈 Debug this

        const { title, completed, userId } = req.body;

        if (!title || userId === undefined || completed === undefined) {
            return res.status(400).json({ error: 'Missing required fields' });
        }

        const todo = await prisma.todo.create({
            data: {
                title,
                completed,
                userId,
            },
        });

        return res.json(todo);
    } catch (error) {
        return res.status(500).json({ error: error.message });
    }
});


todoRouter.get("/getTodos/:userId", async (req, res) => {
    try {
        const todos = await prisma.todo.findMany({ where: { userId: req.params.userId } });
        return res.json(todos);
    } catch (error) {
        return res.status(500).json({ error: error.message });
    }
})


module.exports = todoRouter