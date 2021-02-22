const api = {};

var PS = {};
(function($PS) {

  "use strict";
  $PS["Main"] = $PS["Main"] || {};
  var  code  = $PS["Main"];
  var hello = function (name) {
      return "Hello " + (name + " from purescript");
  };
  code ["hello"] = hello;
})(PS);
api . code  = PS["Main"];



module.exports = async (req, res) => {
	try {
		res.status(200).end(api.code.hello('visitant'));
	} catch (e) {
		console.log(e.message);
	}
};
