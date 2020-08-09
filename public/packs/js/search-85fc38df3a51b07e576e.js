/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/search.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/search.js":
/*!****************************************!*\
  !*** ./app/javascript/packs/search.js ***!
  \****************************************/
/*! no static exports found */
/***/ (function(module, exports) {

throw new Error("Module build failed (from ./node_modules/babel-loader/lib/index.js):\nSyntaxError: C:\\Users\\kelle\\Documents\\sites\\avatars\\app\\javascript\\packs\\search.js: Unexpected token (6:88)\n\n  4 | \n  5 |   var options = {\n> 6 | [{name: \"Motorbike\", type: \"ground\", icon: \"http://lorempixel.com/100/50/transport/10\"}],\n    |                                                                                         ^\n  7 |     getValue: \"name\", \n  8 |     url: function(phrase) {\n  9 |       return \"/search.json?q=\" + phrase;\n    at Parser._raise (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:742:17)\n    at Parser.raiseWithData (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:735:17)\n    at Parser.raise (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:729:17)\n    at Parser.unexpected (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:8757:16)\n    at Parser.parseObjPropValue (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:10538:21)\n    at Parser.parseObjectMember (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:10461:10)\n    at Parser.parseObj (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:10374:25)\n    at Parser.parseExprAtom (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:9995:28)\n    at Parser.parseExprSubscripts (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:9602:23)\n    at Parser.parseMaybeUnary (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:9582:21)\n    at Parser.parseExprOps (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:9452:23)\n    at Parser.parseMaybeConditional (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:9425:23)\n    at Parser.parseMaybeAssign (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:9380:21)\n    at Parser.parseVar (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:11740:26)\n    at Parser.parseVarStatement (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:11549:10)\n    at Parser.parseStatementContent (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:11148:21)\n    at Parser.parseStatement (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:11081:17)\n    at Parser.parseBlockOrModuleBlockBody (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:11656:25)\n    at Parser.parseBlockBody (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:11642:10)\n    at Parser.parseBlock (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:11626:10)\n    at Parser.parseFunctionBody (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:10634:24)\n    at Parser.parseFunctionBodyAndFinish (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:10617:10)\n    at C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:11796:12\n    at Parser.withTopicForbiddingContext (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:10956:14)\n    at Parser.parseFunction (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:11795:10)\n    at Parser.parseFunctionExpression (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:10093:17)\n    at Parser.parseExprAtom (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:10001:21)\n    at Parser.parseExprSubscripts (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:9602:23)\n    at Parser.parseMaybeUnary (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:9582:21)\n    at Parser.parseExprOps (C:\\Users\\kelle\\Documents\\sites\\avatars\\node_modules\\@babel\\parser\\lib\\index.js:9452:23)");

/***/ })

/******/ });
//# sourceMappingURL=search-85fc38df3a51b07e576e.js.map