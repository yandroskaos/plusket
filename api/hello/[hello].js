module.exports = (req, res) => {
  const {
    query: { hello }
  } = req;

  res.send(`Hello ${hello}!`);
};
