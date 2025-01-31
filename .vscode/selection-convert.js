//------------------------------------------------------------------------------
// Author: Rick Pfahl
// Requires: https://github.com/jeff-hykin/selection-convert.git
// Description: filter definitions for Selection Convert Module by jeff-hykin
// Date: 2025-
// Software used in filters:
// - Boxes [https://boxes.thomasjensen.com] 
//

const { execSync } = require('child_process');

//Filter Export Functions

// -- function for Boxes - gradientbox
selectionToGradient = function(text) {
  var result = runFilter(text, 'gradientbox');
  return result;
}

// --/ END Filter Export Functions /--

runFilter = function(text, design) {
  //return "blah"+text+"blah";
  var command = getFilter(text,design);
  //return command;
  var result = "";
  result = execSync(command);
  return result.toString();
}

getFilter = function(text,design) {
  var command = "echo \""+text+"\" | boxes -d "+design+" -p h1 -s 80 -i none -n UTF-8"
  return command;
}


module.exports = { selectionToGradient };


