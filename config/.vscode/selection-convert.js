/*
 ╔══════════════════════════════════════════════════════════════════════════════╗
 ║                                                                              ║
 ║  Author: Rick Pfahl                                                          ║
 ║  Description: Filter definitions for Selection Convert Module by jeff-hykin  ║
 ║  Requires: [https://github.com/jeff-hykin/selection-convert.git]             ║
 ║  Date: Jan 2025                                                              ║
 ║  Software used in filters:                                                   ║
 ║  - Boxes [https://boxes.thomasjensen.com]                                    ║
 ║                                                                              ║
 ╚══════════════════════════════════════════════════════════════════════════════╝

*/
const { execSync } = require('child_process');

//Filter Export Functions

selectionToATargetBlank = function(text){
  var result = '<a href="'+text+'" target="_blank">'+text+'</a>';
  return result;
}
// -- function for Boxes - gradientbox-----------------------------------------
selectionToGradient = function(text) {
  var result = runFilter(text, 'gradientbox');
  return result;
}

selectionToIdiotBox = function(text) {
  var result = runFilter(text, 'idiotbox');
  return result; 
}
  
selectionToDoubleLineBox = function(text) {
  var result = runFilter(text, 'doublelinebox');
  return result; 
}

// --/ END Filter Export Functions /--

runFilter = function(text, design) {
  var command = getFilterCommand(text,design);
  var result = "";
  result = execSync(command);
  return result.toString();
}

getFilterCommand = function(text,design) {
  var command = "echo \""+text+"\" | boxes -d "+design+" -p h1 -s 80 -i none -n UTF-8"
  return command;
}

module.exports = { selectionToATargetBlank, selectionToGradient, selectionToDoubleLineBox, selectionToIdiotBox };
