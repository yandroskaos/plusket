const api = {};
#define module  api
#define exports code
#include "index.js"
#undef module
#undef exports

module.exports = async (req, res) => {
	try {
		res.status(200).end(api.code.hello('visitant'));
	} catch (e) {
		console.log(e.message);
	}
};
