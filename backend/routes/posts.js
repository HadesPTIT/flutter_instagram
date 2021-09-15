const express = require('express');

const router = express.Router();
const Post = require('../models/Post');

// GET ALL POSTS
router.get('/', async (req, res) => {
    try {
        const posts = await Post.find().limit(20);
        res.send(posts);
    } catch (error) {
        res.json({ message: error });
    }
});

// CREATE NEW POST
router.post('/', async (req, res) => {
    const post = new Post({
        title: req.body.title,
        description: req.body.description,
    });

    const savedPost = await post.save()
        .then((result) => {
            console.log(result);
            res.status(200).send(result);
        }).catch((err) => {
            res.status(404).send(err);
            console.log(err);
        });
});

// GET SPECIFIC POST
router.get('/:postId', async (req, res) => {
    try {
        const post = await Post.findById(req.params.postId);
        res.send(post);
    } catch (error) {
        res.json({ message: error });
    }
});

// UPDATE
router.patch('/:postId', async (req, res) => {
    try {
        const updatedPost = await Post.updateOne(
            { _id: req.params.postId },
            { $set: { title: req.body.title, description: req.body.description } }
        );
        console.log(updatedPost);
        res.send(updatedPost);
    } catch (error) {
        res.status(400).json({ message: error });
    }
});

// DELETE
router.delete('/:postId', async (req, res) => {
    try {
        const removedPost = await Post.remove({ _id: req.params.postId });
        res.send(removedPost);
    } catch (error) {
        res.status(400).json({ message: error });
    }
});

module.exports = router;