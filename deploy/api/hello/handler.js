const Hello = require('./hello.js');

module.exports = async (req, res) => {
	try {
		res.status(200).end(Hello.hello('visitant'));
	} catch (e) {
		console.log(e.message);
	}
};
